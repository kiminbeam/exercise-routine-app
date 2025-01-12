
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/user_recode_repository.dart';
import '../../../../main.dart';

class UserRecodeModel {
  List<RecodeInformation> recodeInformationList;

  UserRecodeModel(this.recodeInformationList);
}

class RecodeInformation {
  String date;
  bool isChecked;

  RecodeInformation(this.date, this.isChecked); // 운동하면 true, 안하면 false

  RecodeInformation.fromMap(Map<String, dynamic> map)
      : date = map["date"],
        isChecked = map["checked"];
}


final userRecodeProvider =
    NotifierProvider.autoDispose<UserRecodeVm, UserRecodeModel?>(() {
  return UserRecodeVm();
});

class UserRecodeVm extends AutoDisposeNotifier<UserRecodeModel?> {
  final mContext = navigatorKey.currentContext!;
  final userRecodeRepository = const UserRecodeRepository();

  @override
  UserRecodeModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> responseBody =
        await userRecodeRepository.findAllRecodesByUserId();
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("게시글 목록 보기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    Map<String, dynamic> data = responseBody["response"];
    List<dynamic> list = data["recodeInformationList"];
    List<RecodeInformation> convertList = [];

    for (int i = 0; i < list.length; i++) {
      convertList.add(RecodeInformation.fromMap(list[i]));
    }
    UserRecodeModel userRecodeModel = UserRecodeModel(convertList);
    state = userRecodeModel;
  }
}
