import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_body.dart';

class ListDetailOfDayPage extends ConsumerWidget {
  String dayOfWeek;

  ListDetailOfDayPage(this.dayOfWeek);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    ListDetailOfDayPageModel? listDetailOfDayPageModel =
        ref.watch(listDetailOfDayProvider);

    if (listDetailOfDayPageModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        endDrawer: CustomNavigation(scaffoldKey), // 사이드 메뉴바
        appBar: AppBar(
          title: Center(
            child: Text(
              '${dayOfWeek}요일', // 요일값 받아서 넣기
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListDetailOfDayBody(
            list: listDetailOfDayPageModel!.planOfDayInfomationList),
      );
    }
  }
}
