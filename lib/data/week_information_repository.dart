class WeekInformationRepository {
  const WeekInformationRepository();

  Future<List<WeekInformation>> takeWeekInformaition() async {
    List<WeekInformation> body = await takeWeekInfo();
    return body;
  }
}

List<WeekInformation> takeWeekInfo() {
  return weekList;
}

// 아래는 샘플 데이터. 언제든지 변경될 수 있음
class WeekInformation {
  String dayOfTheWeek;

  List<Exercise> exerciseList;

  WeekInformation({required this.dayOfTheWeek, required this.exerciseList});
}

class Exercise {
  String exerciseName;

  Exercise(this.exerciseName);
}

Exercise exercise1 = Exercise('팔');
Exercise exercise2 = Exercise('어깨');
Exercise exercise3 = Exercise('하체');
Exercise exercise4 = Exercise('등');

List<Exercise> list1 = [exercise1, exercise2, exercise3, exercise4];
List<Exercise> list2 = [exercise1, exercise2];

// 샘플 데이터
List<WeekInformation> weekList = [
  WeekInformation(dayOfTheWeek: '월', exerciseList: list1),
  WeekInformation(dayOfTheWeek: '화', exerciseList: list1),
  WeekInformation(dayOfTheWeek: '수', exerciseList: list1),
  WeekInformation(dayOfTheWeek: '목', exerciseList: list2),
  WeekInformation(dayOfTheWeek: '금', exerciseList: list2),
  WeekInformation(dayOfTheWeek: '토', exerciseList: list2),
  WeekInformation(dayOfTheWeek: '일', exerciseList: list1),
];
