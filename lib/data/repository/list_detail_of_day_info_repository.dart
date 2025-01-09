import 'package:projectsampledata/data/repository/week_info_repository.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

class ListDetailOfDayInfoRepository {
  const ListDetailOfDayInfoRepository();

  //통신
  Future<List<ExercisesOfDayInformation>>
      takeListDetailOfDayInformaition() async {
    List<ExercisesOfDayInformation> body = await exercisesOfDayList;
    return body;
  }
}

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
  // ExercisesOfDayInformation(
  //     exerciseName: '데드리프트', detailOfExercise: detailOfExercise5),
];
