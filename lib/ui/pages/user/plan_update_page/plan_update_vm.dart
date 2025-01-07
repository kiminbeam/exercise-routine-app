import 'package:flutter_riverpod/flutter_riverpod.dart';

final planUpdateProvider = NotifierProvider<PlanUpdateVM, int>(() {
  return PlanUpdateVM();
});

class PlanUpdateVM extends Notifier<int> {
  @override
  int build() {
    init(); // 기존 해당 운동 계획 정보 가져오기
    return 0;
  }

  Future<void> init() async {
    return;
  }
}
