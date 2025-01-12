import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/main.dart';

import '../../../../data/repository/exercise_detail_repository.dart';

class FitnessDetailModel {
  final id;
  final fitnessName;
  final category;
  final imgUrl;
  final content;

  FitnessDetailModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        fitnessName = map["fitnessName"],
        category = map["category"],
        imgUrl = map["imgUrl"],
        content = map["content"];
}

final fitnessDetailProvider =
    NotifierProvider.family<FitnessDetailVM, FitnessDetailModel?, int>(() {
  return FitnessDetailVM();
});

class FitnessDetailVM extends FamilyNotifier<FitnessDetailModel?, int> {
  final mContext = navigatorKey.currentContext;
  ExerciseDetailRepository fitnessDetailRepo = const ExerciseDetailRepository();

  @override
  FitnessDetailModel? build(id) {
    init(id);
    return null;
  }

  // 운동 상세정보 불러오기
  Future<void> init(id) async {
    // fitnessID 가지고 통신
    Map<String, dynamic> responseBody = await fitnessDetailRepo.findById(id);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("계획 상세정보 불러오기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    state = FitnessDetailModel.fromMap(responseBody["response"]);
  }
}
