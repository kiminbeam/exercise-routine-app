import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/repository/week_information_repository.dart';

class MainPageModel {
  List<WeekInformation> weekInformationList;

  MainPageModel(this.weekInformationList);
}

final mainPageProvider = NotifierProvider<WeekInformationVM, MainPageModel?>(() {
  return WeekInformationVM();
});

class WeekInformationVM extends Notifier<MainPageModel?> {
  final weekInformationRepository = const WeekInformationRepository();

  @override
  MainPageModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    List<WeekInformation> response =
        await weekInformationRepository.takeWeekInformaition();

    state = MainPageModel(response);
  }
}
