import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listDetailOfDayProvider = NotifierProvider<ListDetailOfDayVm, int>(() {
  return ListDetailOfDayVm();
});

class ListDetailOfDayVm extends Notifier<int> {
  @override
  int build() {
    // 요일별 운동 리스트 가져오기
    init();
    return 0;
  }

  // 페이지 초기 진입 시, 해당 요일 운동 계획 리스트 가져오는 메서드
  // 변수로 planId 받아야 함
  Future<void> init() async {
    // 통신을 통해서 해당 요일 운동 계획 리스트 가져오기

    // 가져온 해당 요일 계획 리스트를 상태에 등록
    return;
  }

  // 추가하기 버튼 클릭 시 >> 추가하기 상세 화면으로 넘어감
}
