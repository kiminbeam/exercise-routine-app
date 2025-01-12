import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/data/repository/week_info_repository.dart';

import '../../../../main.dart';

class MainPageModel {
  List<MainPageWeekInfo> weekInformationList;

  MainPageModel({required this.weekInformationList});

  MainPageModel.fromMap(Map<String, dynamic> map)
      : weekInformationList = (map['weekInformationList'] as List<dynamic>)
      .map((e) => MainPageWeekInfo.fromMap(e))
      .toList();

  MainPageModel copyWith({List<MainPageWeekInfo>? weekInformationList}) {
    return MainPageModel(
      weekInformationList: weekInformationList ?? this.weekInformationList,
    );
  }
}

class MainPageWeekInfo {
  String dayOfWeek;
  List<String> fitnessList;
  bool? isChecked;

  MainPageWeekInfo({required this.dayOfWeek, required this.fitnessList});

  MainPageWeekInfo.fromMap(Map<String, dynamic> map)
      : dayOfWeek = map['dayOfWeek'],
        fitnessList = (map['fitnessNameList'] as List<dynamic>)
            .map((e) => e as String)
            .toList();
  
  void updateIsChecked(bool isChecked) {
    this.isChecked = isChecked;
  }
}

final mainPageProvider =
NotifierProvider.autoDispose<MainPageVM, MainPageModel?>(() {
  return MainPageVM();
});

class MainPageVM extends AutoDisposeNotifier<MainPageModel?> {
  final mContext = navigatorKey.currentContext!;
  final weekInfoRepository = const WeekInfoRepository();

  @override
  MainPageModel? build() {
    init();
    return null;
  }

  Future<void> init() async {

    // 주석은 recode 옮겨담는 메서드 때리는 용
    //Map<String, dynamic> responseBody1 = await weekInfoRepository.recodeAll();

    SessionUser sessionUser = ref.read(sessionProvider);

    Map<String, dynamic> responseBody =
    await weekInfoRepository.takeWeekInformaition(sessionUser.id!);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("게시글 목록 보기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    List<dynamic> weekInfoData = responseBody["response"]["weekInfo"];
    List<MainPageWeekInfo> weekInfoList =
    weekInfoData.map((e) => MainPageWeekInfo.fromMap(e)).toList();

    for (int i = 0; i < weekInfoList.length; i++) {
      weekInfoList[i].updateIsChecked(weekInfoData[i]["checked"]);
    }
    state = MainPageModel(weekInformationList: weekInfoList);
  }

  Future<void> updateWeekStatus(bool status) async {

    Map<String, dynamic> responseBody =
    await weekInfoRepository.updateWeekStatus(status, GlobalData.dayOfWeekName);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("상태 변경 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    init();
  }
}
