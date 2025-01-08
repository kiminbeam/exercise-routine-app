// StatelessWidget 일때

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_body.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_card.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_button.dart';

class ListDetailOfDayPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomNavigation(scaffoldKey), // 사이드 메뉴바
      appBar: AppBar(
        title: Center(
          child: Text(
            '요일', // 임시 문자열 / 요일값 받아서 넣기
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
