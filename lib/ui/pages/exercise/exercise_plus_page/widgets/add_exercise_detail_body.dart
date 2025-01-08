import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_Input.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_button.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_image.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_plus_page/widgets/add_exercise_detail_title.dart';

class AddExerciseDetailBody extends StatelessWidget {
  final setCount = TextEditingController(); // 세트 수
  final repeatCount = TextEditingController(); // 반복 횟수
  final weight = TextEditingController(); // 무게

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 운동명 보여주는 컨테이너
          AddExerciseDetailTitle(exerciseName: '운동명'),
          SizedBox(height: 30), // 간격

          // 이미지 or 영상 컨테이너 (버튼을 컨테이너로 변경)
          AddExerciseDetailImage(imagePath: ''), // 이미지 경로 넣기
          SizedBox(height: 30),

          // 세트 수 입력 필드
          AddExerciseDetailInput(
              controller: setCount,
              labelText: '세트 수 입력',
              suffixText: '세트',
              icon: Icons.edit),
          SizedBox(height: 16),

          // 반복 횟수 입력 필드
          AddExerciseDetailInput(
              controller: repeatCount,
              labelText: '반복 횟수 입력',
              suffixText: '회',
              icon: Icons.repeat),
          SizedBox(height: 16),

          // 무게 입력 필드
          AddExerciseDetailInput(
              controller: weight,
              labelText: '무게 입력',
              suffixText: 'kg',
              icon: Icons.fitness_center),
          SizedBox(height: 30),

          // 추가하기 버튼
          AddExerciseDetailButton(),
        ],
      ),
    );
  }
}
