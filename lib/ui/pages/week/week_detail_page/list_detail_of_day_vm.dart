import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_repository.dart';

class ListDetailOfDayPageModel {
  List<ExercisesOfDayInformation> exercisesOfDayInformationList;

  ListDetailOfDayPageModel(this.exercisesOfDayInformationList);
}

final listDetailOfDayProvider =
    NotifierProvider<ListDetailOfDayVm, ListDetailOfDayPageModel?>(() {
  return ListDetailOfDayVm();
});

class ExercisesOfDayInformation {
  String exerciseName;
  DetailOfExercise detailOfExercise;

  ExercisesOfDayInformation(
      {required this.exerciseName, required this.detailOfExercise});
}

class DetailOfExercise {
  String bodyPart;
  int setCount;
  int repeatCount;

  DetailOfExercise(this.bodyPart, this.setCount, this.repeatCount);
}

DetailOfExercise detailOfExercise = DetailOfExercise('등', 3, 15);
DetailOfExercise detailOfExercise2 = DetailOfExercise('어깨', 4, 12);
DetailOfExercise detailOfExercise3 = DetailOfExercise('하체', 5, 10);
DetailOfExercise detailOfExercise4 = DetailOfExercise('가슴', 3, 12);
DetailOfExercise detailOfExercise5 = DetailOfExercise('등', 5, 10);

List<ExercisesOfDayInformation> exercisesOfDayList = [
  ExercisesOfDayInformation(
      exerciseName: '랫 풀다운', detailOfExercise: detailOfExercise),
  ExercisesOfDayInformation(
      exerciseName: '오버헤드 프레스', detailOfExercise: detailOfExercise2),
  ExercisesOfDayInformation(
      exerciseName: '스쿼트', detailOfExercise: detailOfExercise3),
  ExercisesOfDayInformation(
      exerciseName: '케이블 크로스오버', detailOfExercise: detailOfExercise4),
  ExercisesOfDayInformation(
      exerciseName: '데드리프트', detailOfExercise: detailOfExercise5),
];

class ListDetailOfDayVm extends Notifier<ListDetailOfDayPageModel?> {
  final listDetailOfDayInfoRepository = const ListDetailOfDayInfoRepository();

  @override
  ListDetailOfDayPageModel? build() {
    // 요일별 운동 리스트 가져오기
    init();
    return null;
  }

  // 페이지 초기 진입 시, 해당 요일 운동 계획 리스트 가져오는 메서드
  // 변수로 plan테이블의 id 받아야 함
  Future<void> init() async {
    // 통신을 통해서 해당 요일 운동 계획 리스트 가져오기
    await listDetailOfDayInfoRepository.takeListDetailOfDayInformaition(
        1, "monday");
    // 가져온 해당 요일 계획 리스트를 상태에 등록
    // state = ListDetailOfDayPageModel(response);
  }
}
