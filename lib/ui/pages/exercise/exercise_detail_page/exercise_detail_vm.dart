import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/main.dart';

import '../../../../data/repository/exercise_detail_repository.dart';

class ExerciseDetailModel {
  final id;
  final fitnessName;
  final category;
  final imgUrl;
  final content;

  ExerciseDetailModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        fitnessName = map["fitnessName"],
        category = map["category"],
        imgUrl = map["imgUrl"],
        content = map["content"];
}

final exerciseDetailProvider =
    NotifierProvider.family<ExerciseDetailVM, ExerciseDetailModel?, int>(() {
  return ExerciseDetailVM();
});

class ExerciseDetailVM
    extends AutoDisposeFamilyNotifier<ExerciseDetailModel?, int> {
  final mContext = navigatorKey.currentContext;
  ExerciseDetailRepository execiseDetailRepo = const ExerciseDetailRepository();

  @override
  ExerciseDetailModel? build(id) {
    init(id);
    return null;
  }

  // 운동 상세정보 불러오기
  Future<void> init(id) async {
    // fitnessID 가지고 통신
    Map<String, dynamic> responseBody = await execiseDetailRepo.findById(id);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("계획 상세정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    state = ExerciseDetailModel.fromMap(responseBody["response"]);
  }
}
