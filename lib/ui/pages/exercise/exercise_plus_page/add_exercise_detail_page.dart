import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_body.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_button.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_image.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_title.dart';

class AddExerciseDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final setCount = TextEditingController();
  final repeatCount = TextEditingController();
  final weight = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 운동명 보여주는 컨테이너
            AddExerciseDetailTitle(title: '운동명'),
            SizedBox(height: 16), // 간격

            // 이미지 or 영상 컨테이너 (버튼을 컨테이너로 변경)
            AddExerciseDetailImage(imagePath: ''), // 이미지 경로 넣기
            SizedBox(height: 16),

            // 세트 수 입력 필드
            AddExerciseDetailBody(
                controller: setCount,
                labelText: '세트 수 입력',
                suffixText: '세트',
                icon: Icons.edit),
            SizedBox(height: 16),

            // 반복 횟수 입력 필드
            AddExerciseDetailBody(
                controller: repeatCount,
                labelText: '반복 횟수 입력',
                suffixText: '회',
                icon: Icons.repeat),
            SizedBox(height: 16),

            // 무게 입력 필드
            AddExerciseDetailBody(
                controller: weight,
                labelText: '무게 입력',
                suffixText: 'kg',
                icon: Icons.fitness_center),
            SizedBox(height: 32),

            // 추가하기 버튼
            AddExerciseDetailButton(),
          ],
        ),
      ),
    );
  }
}
