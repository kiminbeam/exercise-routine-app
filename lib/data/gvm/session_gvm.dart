// dio, secureStorage 라이브러리 추가
// UserRepository 클래스 추가
// 위 내용 반영 후 주석 해제

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:projectsampledata/_core/utils/validator_util.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/user_repository.dart';

import '../../_core/utils/http_util.dart';
import '../../main.dart';

class SessionUser {
  int? id;
  String? username;
  String? accessToken;
  bool? isLogin;

  SessionUser({this.id, this.username, this.accessToken, this.isLogin = false});
}

class SessionGvm extends Notifier<SessionUser> {
//
  final mContext = navigatorKey.currentContext!;
  UserRepository userRepository = const UserRepository();

//
  @override
  SessionUser build() {
    return SessionUser(
        id: null, username: null, accessToken: null, isLogin: false);
  }

  // 로그인
  Future<void> login(String username, String password) async {
    final body = {
      "username": username,
      "password": password,
    };

    final (responseBody, accessToken) =
        await userRepository.findByUsernameAndPassword(body);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("로그인 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
//     // 1. 토큰을 Storage 저장
    await secureStorage.write(key: "accessToken", value: accessToken); // I/O
//     // 2. SessionUser 갱신
    Map<String, dynamic> data = responseBody["response"];
    state = SessionUser(
        id: data["id"],
        username: data["username"],
        accessToken: accessToken,
        isLogin: true);
//     // 3. Dio 토큰 세팅
    dio.options.headers["Authorization"] = accessToken;
    Navigator.popAndPushNamed(mContext, "/main-page");
  }

// 회원가입
  Future<void> join(String username, String password, String rePassword,
      String email, String height, String weight) async {
    final validate1 = validateUsername();
    final validate2 = validatePassword();
    final validate3 = validateEmail();

    if (validate1(username) != null ||
        validate2(password) != null ||
        validate3(email) != null) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(
            content: Text(
                "회원가입 실패 : ${validate1(username) ?? validate2(password) ?? validate3(email)}.")),
      );
      return;
    }

    if (!(password == rePassword)) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : 비밀번호를 다시 확인해주세요.")),
      );
      return;
    }
    if (height.isEmpty) {
      height = "0";
    }
    if (weight.isEmpty) {
      weight = "0";
    }

    if (double.tryParse(height) == null) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("회원가입 실패 :신장을 잘못입력하였습니다.")),
      );
      return;
    }
    if (double.tryParse(weight) == null) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : 몸무게를 잘못입력하였습니다.")),
      );
      return;
    }

    int ss = (double.parse(height) * 10).toInt();
    int sd = (double.parse(weight) * 1000).toInt();

    final body = {
      "username": username,
      "password": password,
      "rePassowrd": rePassword,
      "email": email,
      "height": ss,
      "weight": sd
    };

    Map<String, dynamic> responseBody = await userRepository.save(body);
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("회원가입 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    Navigator.popAndPushNamed(mContext, "/login");
  }

  Future<void> logout() async {
    // 1. 디바이스 토큰 삭제
    await secureStorage.delete(key: "accessToken");
    print("Access token deleted");

    // 2. 상태 갱신
    state = SessionUser();
    print("State updated to new session");

    // 3. dio 갱신
    dio.options.headers["Authorization"] = "";
    print("Dio headers reset");

    // 4. 화면이동
    Navigator.popAndPushNamed(mContext, "/login");
    print("Navigated to login page");
  }

  // 1. 절대 SessionUser가 있을 수가 없다.
  Future<void> autoLogin() async {
    // 1. 토큰 디바이스에서 가져오기
    String? accessToken = await secureStorage.read(key: "accessToken");

    if (accessToken == null) {
      Navigator.popAndPushNamed(mContext, "/login");
      return;
    }

    Map<String, dynamic> responseBody =
        await userRepository.autoLogin(accessToken);
    Logger().d(responseBody);
    if (!responseBody["success"]) {
      Navigator.popAndPushNamed(mContext, "/login");
      return;
    }

    Map<String, dynamic> data = responseBody["response"];
    state = SessionUser(
        id: data["id"],
        username: data["username"],
        accessToken: accessToken,
        isLogin: true);

    dio.options.headers["Authorization"] = accessToken;

    Navigator.popAndPushNamed(mContext, "/main-page");
  }
}

final sessionProvider = NotifierProvider<SessionGvm, SessionUser>(() {
  return SessionGvm();
});
