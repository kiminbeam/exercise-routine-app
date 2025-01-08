import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/exercise_list_repository.dart';
import 'package:projectsampledata/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// model만들기
class ExerciseListModel {
  int? categoryId;
  String? categoryName;
  int? FitnessId;
  String? fitnessName;

  // 생성자
  ExerciseListModel(
      {this.categoryId, this.categoryName, this.FitnessId, this.fitnessName});

  // fromMap
  ExerciseListModel.fromMap(Map<String, dynamic> map)
      : categoryId = map["categoryId"],
        categoryName = map["categoryName"],
        FitnessId = map["FitnessId"],
        fitnessName = map["fitnessName"];
}

//provider 생성
final ExerciseListProvider =
    NotifierProvider<ExerciseListVM, ExerciseListModel?>(() {
  return ExerciseListVM();
});

// 클래스 시작
class ExerciseListVM extends Notifier<ExerciseListModel?> {
  final refreshCtrl = RefreshController();
  final mContext = navigatorKey.currentContext!;
  int count = 0;
  ExerciseListRepository repository = const ExerciseListRepository();

  // state 초기값 생성
  @override
  ExerciseListModel? build() {
    return null;
  }

  // 초기화 : 운동 전체 리스트 뿌리기
  Future<void> init() async {
    // 통신해서 받아온 값 map으로 받아서 responseBody로 저장
    Map<String, dynamic> responseBody = await repository.findAll();

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(SnackBar(
          content: Text("운동 목록을 불러오는데 실패했습니다."
              ": ${responseBody["errorMessage"]}")));
      return;
    }

    List<ExerciseListModel> modelList = responseBody["response"];
    count = categoryCount(modelList);
    // state에 운동 통신해서 받은 운동목록 넣어주기
    state = ExerciseListModel.fromMap(responseBody["response"]);
    refreshCtrl.refreshCompleted();
  }

  Future<void> getListById(int categoryId) async {
    Map<String, dynamic> responseBody = await repository.findById(categoryId);

    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(SnackBar(
          content: Text("해당 카테고리의 운동 목록을 불러오는데 실패했습니다."
              ": ${responseBody["errorMessage"]}")));
      return;
    }
    state = ExerciseListModel.fromMap(responseBody["response"]);
  }

  static int categoryCount(List<ExerciseListModel> m) {
    Set<int> uniqueCategoryIds =
        m.map((model) => model.categoryId).whereType<int>().toSet();

    return uniqueCategoryIds.length;
  }
}
