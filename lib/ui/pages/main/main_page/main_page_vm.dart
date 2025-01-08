import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/data/repository/week_info_repository.dart';

class MainPageModel {
  List<MainPageWeekInfo> weekInformationList;

  MainPageModel({required this.weekInformationList});

  MainPageModel.fromMap(Map<String, dynamic> map)
      : weekInformationList = (map['weekInformationList'] as List<dynamic>)
            .map((e) => MainPageWeekInfo.fromMap(e))
            .toList();

  MainPageModel copyWith({List<MainPageWeekInfo>? weekInformationList}) {
    return MainPageModel(
      weekInformationList: weekInformationList ?? this.weekInformationList,
    );
  }
}

class MainPageWeekInfo {
  String dayOfWeek;
  List<String> fitnessList;

  MainPageWeekInfo({required this.dayOfWeek, required this.fitnessList});

  MainPageWeekInfo.fromMap(Map<String, dynamic> map)
      : dayOfWeek = map['dayOfWeek'],
        fitnessList = (map['fitnessNameList'] as List<dynamic>)
            .map((e) => e as String)
            .toList();
}

final mainPageProvider = NotifierProvider<MainPageVM, MainPageModel?>(() {
  return MainPageVM();
});

class MainPageVM extends Notifier<MainPageModel?> {
  final weekInfoRepository = const WeekInfoRepository();

  @override
  MainPageModel? build() {
    init();
    return null;
  }

  Future<void> init() async {
    Map<String, dynamic> responseBody = await weekInfoRepository
        .takeWeekInformaition(ref.read(sessionProvider).id!);

    // if (!responseBody["success"]) {
    //   ScaffoldMessenger.of(mContext!).showSnackBar(
    //     SnackBar(
    //         content: Text("게시글 목록 보기 실패 : ${responseBody["errorMessage"]}")),
    //   );
    //   return;
    // }

    List<dynamic> weekInfoData = responseBody["response"]["weekInfo"];
    List<MainPageWeekInfo> weekInfoList =
        weekInfoData.map((e) => MainPageWeekInfo.fromMap(e)).toList();
    state = MainPageModel(weekInformationList: weekInfoList);
    print(state?.weekInformationList.toString());
    // List<MainPageWeekInformation> weekInfoList =
    //     weekInfoData!.map((e) => MainPageWeekInformation.fromMap(e)).toList();
    // state = MainPageModel(weekInformationList: weekInfoList);
  }
}
