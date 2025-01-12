import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/plan_detail_repository.dart';
import 'package:projectsampledata/main.dart';

class PlanDetailModel {
  final planId;
  final day;
  final fitnessName; // map에 fitness가 들어가 있을 거다. 거기서 찾아 와야함
  final fitnessImg; // map에 fitness가 들어가 있을 거다.
  final fitnessContent; // map에 fitness가 들어가 있을 거다.
  final set;
  final repeat;
  final weight;

  // 기본 생성자
  PlanDetailModel({
    required this.planId,
    required this.day,
    required this.fitnessName,
    required this.fitnessImg,
    required this.fitnessContent,
    required this.set,
    required this.repeat,
    required this.weight,
  });

  PlanDetailModel.fromMap(Map<String, dynamic> map)
      : planId = map["id"],
        day = map["day"],
        fitnessName = map["fitnessName"],
        fitnessImg = map["fitnessImgUrl"],
        fitnessContent = map["fitnessContent"],
        set = map["exerciseSet"],
        repeat = map["repeat"],
        weight = map["weight"];

  PlanDetailModel copyWith(
      {int? planId,
      String? day,
      String? fitnessName,
      String? fitnessImg,
      String? fitnessContent,
      int? set,
      int? repeat,
      int? weight}) {
    return PlanDetailModel(
        planId: planId ?? this.planId,
        day: day ?? this.day,
        fitnessName: fitnessName ?? this.fitnessName,
        fitnessImg: fitnessImg ?? this.fitnessImg,
        fitnessContent: fitnessContent ?? this.fitnessContent,
        set: set ?? this.set,
        repeat: repeat ?? this.repeat,
        weight: weight ?? this.weight);
  }

  @override
  String toString() {
    return 'PlanDetailModel{planId: $planId, day: $day, fitnessName: $fitnessName, fitnessImg: $fitnessImg, fitnessContent: $fitnessContent, set: $set, repeat: $repeat, weight: $weight}';
  }
}

final planDetailProvider =
    NotifierProvider.family<PlanDetailVM, PlanDetailModel?, int>(() {
  return PlanDetailVM();
});

class PlanDetailVM extends FamilyNotifier<PlanDetailModel?, int> {
  final mContext = navigatorKey.currentContext!;
  PlanDetailRepository repo = const PlanDetailRepository();

  @override
  PlanDetailModel? build(planId) {
    init(planId);
    return null;
  }

  Future<void> init(planId) async {
    // planId 받아야 함..
    print("planId 출력 중~~~~` $planId");

    // 토큰 가져와서 헤더에 넣어서 조회 요청
    // 통신으로 fitness_id 가지고 해당 운동 계획 조회
    Map<String, dynamic> responseBody = await repo.findByPlanID(planId);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("계획 상세정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    // state에 등록하기
    state = PlanDetailModel.fromMap(responseBody["response"]);
  }

  void updateStatus(PlanDetailModel updatedPlan) {
    state = updatedPlan; // 새로운 모델 상태로 갱신
  }
}
