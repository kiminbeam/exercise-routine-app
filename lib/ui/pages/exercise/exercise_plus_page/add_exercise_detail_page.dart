import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_Input.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_body.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_button.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_image.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_title.dart';

class AddExerciseDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomNavigation(scaffoldKey), // 메뉴바
      appBar: AppBar(
        title: Center(
          child: Text(
            '운동 추가',
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
      body: AddExerciseDetailBody(),
    );
  }
}
