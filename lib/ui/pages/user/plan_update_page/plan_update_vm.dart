import 'package:flutter_riverpod/flutter_riverpod.dart';

// NotifierProvider.family로 변경 필요
final planUpdateProvider = NotifierProvider<PlanUpdateVM, int>(() {
  return PlanUpdateVM();
});

class PlanUpdateVM extends Notifier<int> {
  @override
  int build() {
    init(); // 기존 해당 운동 계획 정보 가져 오기/ plan 객체 가져오면 되나?
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
  Future<void> updatePlan() async {
    // 받은 데이터 Map으로 변경

    // 통신으로 Map데이터를 계획 수정 요청 보내기

    // 응답이 200 이 아닐 경우 처리 로직(스넥바 사용)

    // 응답이 200 일 경우 상태 변경 시키기. Plan
  }

// 수정하기 페이지 넘어올 때, 해당 계획 정보 받아내는 메서드
}
