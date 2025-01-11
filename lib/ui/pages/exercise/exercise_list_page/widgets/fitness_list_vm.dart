import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/fitness_list_repository.dart';
import 'package:projectsampledata/main.dart';

class FitnessListModel {
  List<FitnessItem> fitnessItems;
  List<CategoryItem> categoryItems;
  int? selectedIndex; // 선택된 카테고리 인덱스

  FitnessListModel(this.fitnessItems, this.categoryItems, {this.selectedIndex});

  FitnessListModel.fromList(
      List<dynamic> responseFitnessItems, List<dynamic> responseCategoryItems,
      {this.selectedIndex})
      : fitnessItems =
            responseFitnessItems.map((e) => FitnessItem.fromMap(e)).toList(),
        categoryItems =
            responseCategoryItems.map((e) => CategoryItem.fromMap(e)).toList();

  List<FitnessItem> getFilteredFitnessItems() {
    if (selectedIndex == null) {
      return fitnessItems;
    }
    final selectedCategoryId = categoryItems[selectedIndex!].categoryId;

    return fitnessItems
        .where((item) => item.categoryId == selectedCategoryId)
        .toList();
  }
}

class CategoryItem {
  int categoryId;
  String categoryName;

  CategoryItem(this.categoryId, this.categoryName);

  CategoryItem.fromMap(Map<String, dynamic> map)
      : categoryId = map["categoryId"],
        categoryName = map["categoryName"];
}

class FitnessItem {
  int fitnessId;
  String fitnessName;
  int categoryId;

  FitnessItem(this.fitnessId, this.fitnessName, this.categoryId);

  FitnessItem.fromMap(Map<String, dynamic> map)
      : fitnessId = map["fitnessId"],
        fitnessName = map["fitnessName"],
        categoryId = map["categoryId"];
}

// Provider 생성
final fitnessListProvider =
    NotifierProvider<FitnessListVM, FitnessListModel?>(() {
  return FitnessListVM();
});

// ViewModel 클래스
class FitnessListVM extends Notifier<FitnessListModel?> {
  final mContext = navigatorKey.currentContext!;
  FitnessListRepository repository = const FitnessListRepository();

  @override
  FitnessListModel? build() {
    init();
    return null;
  }

  /// 초기화: 전체 피트니스 리스트 가져오기
  Future<void> init() async {

    Map<String, dynamic> responseBodyFiness = await repository.findAllFitness();
    Map<String, dynamic> responseBodyCategory =
        await repository.findAllCategory();

    if (!responseBodyFiness["success"] || !responseBodyCategory["success"]) {
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(
          content: Text(
              "피트니스 목록을 불러오는데 실패했습니다: ${responseBodyFiness["errorMessage"]}"),
        ),
      );
      return;
    }

    List<dynamic> fitnessList = responseBodyFiness["response"];
    List<dynamic> categoryList = responseBodyCategory["response"];

    state = FitnessListModel.fromList(fitnessList, categoryList);
  }

  /// 선택된 카테고리 인덱스 업데이트
  void selectIndex(int? index) {
    state = FitnessListModel(
      state!.fitnessItems, // 원본 리스트 유지
      state!.categoryItems,
      selectedIndex: index, // 선택된 카테고리 인덱스만 업데이트
    );
  }
}
