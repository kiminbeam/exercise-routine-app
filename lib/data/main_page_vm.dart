import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/week_information_repository.dart';

final weekInformationProvider =
    NotifierProvider<WeekInformationVM, List<WeekInformation>>(() {
  return WeekInformationVM();
});

class WeekInformationVM extends Notifier<List<WeekInformation>> {
  final weekInformationRepository = const WeekInformationRepository();

  @override
  List<WeekInformation> build() {
    return weekList;
  }
}
