import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addExerciseDetailProvider =
    NotifierProvider<AddExerciseDetailVM, int>(() {
  return AddExerciseDetailVM();
});

class AddExerciseDetailVM extends Notifier<int> {
  @override
  int build() {
    // 해당 운동 상세 정보(운동명, gif 이미지) 가져오기
    init();
    return 0;
  }

  // 페이지 초기 진입 시, 해당 운동 상세 정보(운동명, gif 이미지) 가져오는 메서드
  // 변수로 fitnessId? planId? 받아야 함
  Future<void> init() async {
    // 통신을 통해서 해당 운동 상세 정보(운동명, gif 이미지) 가져 오기

    // 가져온 운동 상세 정보를 상태에 등록
    return;
  }

  // 추가하기 버튼 클릭 시 >> plan_tb에 insert 요청 보내는 메서드
  Future<void> AddExerciseDetail() async {
    // 받은 데이터 Map으로 변경

    // 통신으로 Map데이터를 운동 계획 추가 요청 보내기

    // 응답이 200 이 아닐 경우 처리 로직(스넥바 사용)

    // 응답이 200 일 경우 상태 변경 시키기. Plan
  }
}
