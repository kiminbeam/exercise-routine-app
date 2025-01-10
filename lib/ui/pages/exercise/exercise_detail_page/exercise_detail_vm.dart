import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repository/exercise_detail_repository.dart';

final exerciseDetailProvider = NotifierProvider<ExerciseDetailVM, int>(() {
  return ExerciseDetailVM();
});

class ExerciseDetailVM extends Notifier<int> {
  ExerciseDetailRepository execiseDetailRepo = const ExerciseDetailRepository();

  @override
  int build() {
    return 0;
  }

  // 운동 상세정보 불러오기
  Future<void> init() async {}
}
