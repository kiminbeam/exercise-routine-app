import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_repository.dart';
import 'package:projectsampledata/main.dart';

class ListDetailOfDayPageModel {
  List<PlanOfDayInfo> planOfDayInfomationList;

  ListDetailOfDayPageModel({required this.planOfDayInfomationList});

  // JSON 데이터를 모델로 변환
  ListDetailOfDayPageModel.fromMap(Map<String, dynamic> map)
      : planOfDayInfomationList =
            (map['planOfDayInfomationList'] as List<dynamic>)
                .map((e) => PlanOfDayInfo.fromMap(e))
                .toList();

  // 상태 복사
  ListDetailOfDayPageModel copyWith(
      {List<PlanOfDayInfo>? planOfDayInfomationList}) {
    return ListDetailOfDayPageModel(
      planOfDayInfomationList:
          planOfDayInfomationList ?? this.planOfDayInfomationList,
    );
  }
}

class PlanOfDayInfo {
  int id;
  String fitnessName;
  String bodyPart;
  int setCount;
  int repeatCount;

  PlanOfDayInfo({
    required this.id,
    required this.fitnessName,
    required this.bodyPart,
    required this.setCount,
    required this.repeatCount,
  });

  PlanOfDayInfo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        fitnessName = map['fitnessName'],
        bodyPart = map['bodyPart'],
        setCount = map['setCount'],
        repeatCount = map['repeatCount'];
}

final listDetailOfDayProvider =
    NotifierProvider<ListDetailOfDayVm, ListDetailOfDayPageModel?>(() {
  return ListDetailOfDayVm();
});

class ListDetailOfDayVm extends Notifier<ListDetailOfDayPageModel?> {
  final mContext = navigatorKey.currentContext!;
  final listDetailOfDayInfoRepository = const ListDetailOfDayInfoRepository();

  @override
  ListDetailOfDayPageModel? build() {
    // 요일별 운동 리스트 가져오기
    init();
    return null;
  }

  // 페이지 초기 진입 시, 해당 요일 운동 계획 리스트 가져오는 메서드
  Future<void> init() async {
    // 통신으로 해당 요일 운동 계획 리스트 가져오기
    // ref.read(sessionProvider).id : 로그인한 유저의 id
    Map<String, dynamic> responseBody = await listDetailOfDayInfoRepository
        .takeListDetailOfDayInformaition(ref.read(sessionProvider).id!, "day");

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("운동 목록 보기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }

    List<dynamic> planOfDayInfoData = responseBody["response"]["planOfDayInfo"];
    List<PlanOfDayInfo> planOfDayInfoList =
        planOfDayInfoData.map((e) => PlanOfDayInfo.fromMap(e)).toList();
    // 가져온 해당 요일 계획 리스트를 상태에 등록
    state =
        ListDetailOfDayPageModel(planOfDayInfomationList: planOfDayInfoList);
    print(state?.planOfDayInfomationList.toString()); // 데이터 확인 용 출력
  }

  // 운동 삭제
  void remove(int id) {
    ListDetailOfDayPageModel model = state!;
    model.planOfDayInfomationList =
        model.planOfDayInfomationList.where((p) => p.id != id).toList();

    // 삭제를 상태에 반영
    state =
        state!.copyWith(planOfDayInfomationList: model.planOfDayInfomationList);
  }
}
