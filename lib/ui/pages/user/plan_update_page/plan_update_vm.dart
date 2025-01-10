import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/plan_update_repository.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/plan_detail_vm.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

import '../../../../main.dart';

class PlanUpdateModel {
  final int planId;

  PlanUpdateModel({required this.planId});
}

// NotifierProvider.family로 변경 필요
final planUpdateProvider = NotifierProvider.autoDispose<PlanUpdateVM, int>(() {
  return PlanUpdateVM();
});

class PlanUpdateVM extends AutoDisposeNotifier<int> {
  final mContext = navigatorKey.currentContext!;
  PlanUpdateRepository planUpDateRepo = const PlanUpdateRepository();

  @override
  int build() {
    // init(); // 기존 해당 운동 계획 정보 가져 오기 수정하는데 필요한가?
    return 0;
  }

  // 페이지 초기 진입 시, 이전에 설정해 두었던 계획 데이터 가져 오는 메서드
  // 변수로 계획 ID 받아야 함...
  Future<void> init() async {
    // 통신을 통해서 해당 계획 정보 가져 오기

    // 가져온 계획 정보를 상태에 등록
    return;
  }

  // 수정하기 버튼 클릭 시 >> 수정 요청 보내는 메서드
  Future<void> updatePlan(
      int planId, String sets, String repeatCount, String weight) async {
    int set = int.parse(sets);
    int repeatC = int.parse(repeatCount);
    int weighData = int.parse(weight);
    // 받은 데이터 Map으로 변경
    Map<String, dynamic> requestData = {
      "id": planId,
      "exerciseSet": set,
      "repeat": repeatC,
      "weight": weighData,
    };
    // 통신으로 Map데이터를 계획 수정 요청 보내기
    Map<String, dynamic> responseBody =
        await planUpDateRepo.updatePlan(requestData);

    // 응답이 200 이 아닐 경우 처리 로직(스넥바 사용)
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("계획 상세정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    final updatedPlan = PlanDetailModel.fromMap(responseBody["response"]);

    // 응답이 200 일 경우 상태 변경 시키기. PlanDetailPage, ListDetailOfDayPage
    // 1. PlanDetailPage 상태 변경
    PlanDetailVM vm = ref.read(planDetailProvider(planId).notifier);
    PlanDetailModel? model = vm.state;
    PlanDetailModel updateModel =
        model!.copyWith(set: set, repeat: repeatC, weight: weighData);
    vm.updateStatus(updateModel);

    ref.read(listDetailOfDayProvider.notifier).init();
    ref.read(planDetailProvider(planId).notifier).init(planId);

    Navigator.pop(mContext);
  }
}
