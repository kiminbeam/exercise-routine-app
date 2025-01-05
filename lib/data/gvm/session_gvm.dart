
// dio, secureStorage 라이브러리 추가
// UserRepository 클래스 추가
// 위 내용 반영 후 주석 해제


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../main.dart';
//
// class SessionUser {
//   int? id;
//   String? username;
//   String? accessToken;
//   bool? isLogin;
//
//   SessionUser({this.id, this.username, this.accessToken, this.isLogin = false});
// }
//
// class SessionGVM extends Notifier<SessionUser> {
//
//   final mContext = navigatorKey.currentContext!;
//   //UserRepository userRepository = const UserRepository();
//
//   @override
//   SessionUser build() {
//     return SessionUser(
//         id: null, username: null, accessToken: null, isLogin: false);
//   }
//
//   Future<void> login(String username, String password) async {
//     final body = {
//       "username": username,
//       "password": password,
//     };
//
//     final (responseBody, accessToken) =
//         await userRepository.findByUsernameAndPassword(body);
//
//     if (!responseBody["success"]) {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         SnackBar(content: Text("로그인 실패 : ${responseBody["errorMessage"]}")),
//       );
//       return;
//     }
//     // 1. 토큰을 Storage 저장
//     await secureStorage.write(key: "accessToken", value: accessToken); // I/O
//
//     // 2. SessionUser 갱신
//     Map<String, dynamic> data = responseBody["response"];
//     state = SessionUser(
//         id: data["id"],
//         username: data["username"],
//         accessToken: accessToken,
//         isLogin: true);
//
//     // 3. Dio 토큰 세팅
//     dio.options.headers["Authorization"] = accessToken;
//
//     Logger().d("로그인", dio.options.headers);
//
//     Navigator.popAndPushNamed(mContext, "/post/list");
//   }
//
//   Future<void> join(String username, String email, String password) async {
//     final body = {
//       "username": username,
//       "email": email,
//       "password": password,
//     };
//
//     Map<String, dynamic> responseBody = await userRepository.save(body);
//     if (!responseBody["success"]) {
//       ScaffoldMessenger.of(mContext!).showSnackBar(
//         SnackBar(content: Text("회원가입 실패 : ${responseBody["errorMessage"]}")),
//       );
//       return;
//     }
//
//     Navigator.pushNamed(mContext, "/login");
//   }
//
//   Future<void> logout() async {
//     // 1. 디바이스 토큰 삭제
//     await secureStorage.delete(key: "accessToken");
//
//     // 2. 상태 갱신
//     state = SessionUser();
//
//     // 3. dio 갱신
//     dio.options.headers["Authorization"] = "";
//
//     // 4. 화면이동
//     Navigator.popAndPushNamed(mContext, "/login");
//   }
//
//   // 1. 절대 SessionUser가 있을 수가 없다.
//   Future<void> autoLogin() async {
//     // 1. 토큰 디바이스에서 가져오기
//     String? accessToken = await secureStorage.read(key: "accessToken");
//
//     if (accessToken == null) {
//       Navigator.popAndPushNamed(mContext, "/login");
//       return;
//     }
//
//     Map<String, dynamic> responseBody =
//         await userRepository.autoLogin(accessToken);
//
//     if (!responseBody["success"]) {
//       Navigator.popAndPushNamed(mContext, "/login");
//       return;
//     }
//
//     Map<String, dynamic> data = responseBody["response"];
//     state = SessionUser(
//         id: data["id"],
//         username: data["username"],
//         accessToken: accessToken,
//         isLogin: true);
//
//     dio.options.headers["Authorization"] = accessToken;
//
//     Navigator.popAndPushNamed(mContext, "/post/list");
//   }
// }
//
// final sessionProvider = NotifierProvider<SessionGVM, SessionUser>(() {
//   return SessionGVM();
// });
