// StatelessWidget 일때

import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_body.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/widgets/list_detail_of_day_button.dart';

class ListDetailOfDayPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomNavigation(scaffoldKey), // 메뉴바
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            // 추가하기 버튼
            child: ListDetailOfDayButton(),
          ),

          // 운동 리스트
          Expanded(
            child: ListView(
              children: [
                // 임시 문자열과 숫자로 해놓고 데이터베이스 확실해지면 바꾸기
                WorkoutCard(
                  title: '운동명',
                  bodyPart: '부위',
                  setCount: 3,
                  repeatCount: 15,
                ),
                WorkoutCard(
                  title: '운동명',
                  bodyPart: '부위',
                  setCount: 4,
                  repeatCount: 12,
                ),
                WorkoutCard(
                  title: '운동명',
                  bodyPart: '부위',
                  setCount: 2,
                  repeatCount: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
