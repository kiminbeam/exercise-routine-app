import 'package:flutter/material.dart';
import 'package:projectsampledata/data/repository/list_detail_of_day_info_repository.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

class ExerciseCard extends StatelessWidget {
  final ExercisesOfDayInformation exercisesOfDayInformation;
  // final title;
  // final bodypart;
  // final setCount;
  // final repeatCount;

  ExerciseCard({
    required this.exercisesOfDayInformation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () {
          // 카드 클릭시 해당 운동 상세 페이지로 이동
        },
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양옆으로 배치
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
                  mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 가운데 정렬
                  children: [
                    Text(
                      '${exercisesOfDayInformation.exerciseName}',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${exercisesOfDayInformation.detailOfExercise.bodyPart}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '${exercisesOfDayInformation.detailOfExercise.setCount}세트',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '${exercisesOfDayInformation.detailOfExercise.repeatCount}회',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),

                // 삭제 버튼
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // 삭제 동작
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
