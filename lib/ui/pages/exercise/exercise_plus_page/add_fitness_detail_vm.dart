import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/_core/utils/validator_util.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/data/repository/exercise_repository.dart';
import 'package:projectsampledata/main.dart';
import 'package:projectsampledata/ui/pages/main/main_page/main_page_vm.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

class FitnessDetailModel{
    int? id;
    String? fitnessName;
    String? imageUrl;
    String? content;


    FitnessDetailModel({this.id, this.fitnessName,this.imageUrl,this.content});
    FitnessDetailModel.fromMap(Map<String, dynamic> map)
          :id = map["id"],
          fitnessName = map["fitnessName"],
          imageUrl = map["imageUrl"],
          content = map["content"];
}

final addFitnessDetailProvider =
    NotifierProvider.family.autoDispose< AddFitnessDetailVM, FitnessDetailModel?,int>(() {
  return AddFitnessDetailVM();
});

class AddFitnessDetailVM extends AutoDisposeFamilyNotifier<FitnessDetailModel?,int> {
  final mContext = navigatorKey.currentContext!;
  ExerciseRepository exerciseRepository  =  const ExerciseRepository();

 @override
 FitnessDetailModel? build(id) {
    // 해당 운동 상세 정보(운동명, gif 이미지) 가져오기
    init(id);
    return null;
  }

  // 페이지 초기 진입 시, 해당 운동 상세 정보(운동명, gif 이미지) 가져오는 메서드
  // 변수로 fitnessId? planId? 받아야 함
  Future<void> init(int id) async {
    // 통신을 통해서 해당 운동 상세 정보(운동명, gif 이미지) 가져 오기
    Map<String,dynamic> responseBody = await exerciseRepository.findByFitnessId(id);
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
            content: Text("게시글 목록보기 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    // 가져온 운동 상세 정보를 상태에 등록
    FitnessDetailModel model = FitnessDetailModel.fromMap(responseBody["response"]);
    state = model;
  }

  // 추가하기 버튼 클릭 시 >> plan_tb에 insert 요청 보내는 메서드
  Future<void> AddExerciseDetail(int fitnessId, String dayOfWeek, String exerciseSet, String repeat, String weight) async {
    // 받은 데이터 Map으로 변경
    final ve = validateExerciseSet();
    final vr = validateRepeat();
    final vw = validateWeight();

    if(ve(exerciseSet)!=null || vr(repeat)!=null || vw(weight)!=null){
      ScaffoldMessenger.of(mContext).showSnackBar(
        SnackBar(content: Text("운동 추가 실패 : ${ve(exerciseSet) ?? vr(repeat)?? vw(weight)}")),
      );
      return;
    }
    final body = {
      "fitnessId": fitnessId,
      "dayOfWeek": dayOfWeek,
      "exerciseSet": int.tryParse(exerciseSet) ?? 0,
      "repeat": int.tryParse(repeat) ?? 0,
      "weight": (double.parse(weight) * 1000).toInt(),
    };

    // 통신으로 Map데이터를 운동 계획 추가 요청 보내기
    Map<String,dynamic> responseBody =  await exerciseRepository.saveExercise(ref.read(sessionProvider).id!,body);
    // 응답이 200 이 아닐 경우 처리 로직(스넥바 사용)
    if (!responseBody["success"]) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(content: Text("운동 추가 실패 : ${responseBody["errorMessage"]}")),
      );
      return;
    }
    // 응답이 200 일 경우 상태 변경 시키기. Plan
    //Main-List init
    MainPageVM vm = ref.read(mainPageProvider.notifier);
    vm.init();
    // Datail init
    ListDetailOfDayVm vm2 = ref.read(listDetailOfDayProvider.notifier);
    vm2.init();
    // 페이지 이동
    Navigator.popAndPushNamed(mContext, "/day-exercise");
  }
}


