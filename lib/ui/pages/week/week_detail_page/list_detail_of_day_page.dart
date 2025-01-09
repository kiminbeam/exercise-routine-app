// StatelessWidget 일때

import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_body.dart';

class ListDetailOfDayPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String dayOfWeek;

  ListDetailOfDayPage(this.dayOfWeek);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomNavigation(scaffoldKey), // 사이드 메뉴바
      appBar: AppBar(
        title: Center(
          child: Text(
            '${dayOfWeek}요일', // 임시 문자열 / 요일값 받아서 넣기
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 동작 추가
          },
        ),
      ),
      body: ListDetailOfDayBody(),
    );
  }
}
