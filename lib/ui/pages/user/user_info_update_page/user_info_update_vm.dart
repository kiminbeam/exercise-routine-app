import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/user_info_update_repository.dart';
import 'package:projectsampledata/main.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_vm.dart';

class UpdateForUserInfoModel {
  final id;
  final username;
  final email;
  final int weight;
  final int height;

  UpdateForUserInfoModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.weight,
      required this.height});

  UpdateForUserInfoModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        username = map["username"],
        email = map["email"],
        weight = map["weight"] ?? 0,
        height = map["height"] ?? 0;
//copyWith
}

final userInfoUpdateProvider = NotifierProvider.family
    .autoDispose<UserInfoUpdateVM, UpdateForUserInfoModel?, int>(() {
  return UserInfoUpdateVM();
});

class UserInfoUpdateVM
    extends AutoDisposeFamilyNotifier<UpdateForUserInfoModel?, int> {
  final mContext = navigatorKey.currentContext!;
  UserInfoUpdateRepository userInfoUpdateRepo =
      const UserInfoUpdateRepository();

  @override
  UpdateForUserInfoModel? build(id) {
    init(id); // 현재 유저 id 통해서 사용자 정보 가져 와야 한다
    return null;
  }

  // 사용자 정보 수정 페이지 진입 시, 해당 유저 정보 가져오는 메서드 // id 매개변수로 받아와야 함.
  Future<void> init(id) async {
    // 통신을 통해서 해당 유저 정보 가져 오기
    Map<String, dynamic> responseBody =
        await userInfoUpdateRepo.findByUserId(id);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("유저 정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    // 가져온 유저 정보를 상태에 등록
    UpdateForUserInfoModel model =
        UpdateForUserInfoModel.fromMap(responseBody["response"]);

    state = model;
  }

  // 수정하기 버튼 클릭 시 >> 수정 요청 보내는 메서드
  Future<void> updateUserInfo(
      {required String email,
      required String height,
      required String weight}) async {
    if (email == "") {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("이메일을 입력해주세요")),
      );
      return;
    }
    if (height.startsWith("0") || weight.startsWith("0")) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("키와 몸무게는 0으로 시작할 수 없습니다 ")),
      );
      return;
    }

    if (height == "") height = "0";
    if (weight == "") weight = "0";

    int parseHeight;
    int parseWeight;
    try {
      parseHeight = int.parse(height);
      parseWeight = int.parse(weight);
    } catch (e) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("키와 몸무게는 숫자만 입력할 수 있습니다")),
      );
      return;
    }

    // 변수로 받은 데이터를 Map으로 파싱
    Map<String, dynamic> requestData = {
      "email": email,
      "height": parseHeight != 0 ? parseHeight * 10 : 0,
      "weight": parseWeight != 0 ? parseWeight * 10 : 0,
    };

    // 통신을 통해서, 사용자 정보 수정 요청 보내기 (Map 데이터)
    Map<String, dynamic> responseBody =
        await userInfoUpdateRepo.updateUserInfo(requestData);

    // 상태가 200이 아닐 경우 처리 메서드 (스넥바 사용)
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("유저 정보 수정 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    // 통신이 정상적으로 이루어 졌을 경우, 상태 업데이트 시키기, userInfoPage -> VM
    final userInfoVM = ref.read(userInfoProvider.notifier);
    userInfoVM.updateUserInfo(responseBody["response"]);

    ref.read(userInfoProvider.notifier).init();
    Navigator.pop(mContext);
  }
}
