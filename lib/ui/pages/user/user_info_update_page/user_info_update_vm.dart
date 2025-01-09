import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/user_info_update_repository.dart';
import 'package:projectsampledata/main.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_vm.dart';

class UpdateForUserInfoModel {
  final id;
  final username;
  final email;
  final weight;
  final height;

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
        weight = map["weight"],
        height = map["height"];
//copyWith
}

final userInfoUpdateProvider = NotifierProvider.family
    .autoDispose<UserInfoUpdateVM, UpdateForUserInfoModel?, int>(() {
  return UserInfoUpdateVM();
});

class UserInfoUpdateVM
    extends AutoDisposeFamilyNotifier<UpdateForUserInfoModel?, int> {
  final mContext = navigatorKey.currentContext!;
  UserInfoUpdateRepository uInfoUpdateRepo = const UserInfoUpdateRepository();

  @override
  UpdateForUserInfoModel? build(id) {
    init(); // 현재 유저 id 통해서 사용자 정보 가져 와야 한다
    return null;
  }

  // 사용자 정보 수정 페이지 진입 시, 해당 유저 정보 가져오는 메서드 // id 매개변수로 받아와야 함.
  Future<void> init() async {
    // 통신을 통해서 해당 유저 정보 가져 오기
    Map<String, dynamic> responseBody = await uInfoUpdateRepo.findByUserId(1);

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
  Future<void> updateUserInfo(String username, String password, String email,
      String height, String weight) async {
    final int parseHeight = int.parse(height);
    final int parseWeight = int.parse(weight);

    // 토큰 가져와서 보내야할 데이터의 헤더에 넣기

    // 변수로 받은 데이터를 Map으로 파싱
    Map<String, dynamic> requestData = {
      "username": username,
      "password": password,
      "email": email,
      "height": parseHeight,
      "weight": parseWeight,
    };

    // 통신을 통해서, 사용자 정보 수정 요청 보내기 (Map 데이터)
    Map<String, dynamic> responseBody =
        await uInfoUpdateRepo.updateUserInfo(requestData);

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

    Navigator.pop(mContext);
  }
}
