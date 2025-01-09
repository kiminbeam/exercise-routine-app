import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_info_repository.dart';

class ListDetailOfDayPageModel {
  List<ExercisesOfDayInformation> exercisesOfDayInformationList;

  ListDetailOfDayPageModel(this.exercisesOfDayInformationList);
}

final listDetailOfDayProvider =
    NotifierProvider<ListDetailOfDayVm, ListDetailOfDayPageModel?>(() {
  return ListDetailOfDayVm();
});

class ListDetailOfDayVm extends Notifier<ListDetailOfDayPageModel?> {
  final listDetailOfDayInfoRepository = const ListDetailOfDayInfoRepository();

  @override
  ListDetailOfDayPageModel? build() {
    // 요일별 운동 리스트 가져오기
    init();
    return null;
  }

  // 페이지 초기 진입 시, 해당 요일 운동 계획 리스트 가져오는 메서드
  // 변수로 planId 받아야 함
  Future<void> init() async {
    // 통신을 통해서 해당 요일 운동 계획 리스트 가져오기
    List<ExercisesOfDayInformation> response =
        await listDetailOfDayInfoRepository.takeListDetailOfDayInformaition();

    // 가져온 해당 요일 계획 리스트를 상태에 등록
    state = ListDetailOfDayPageModel(response);
  }
}
