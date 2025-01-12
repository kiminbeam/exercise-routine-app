import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_vm.dart';

class ExerciseCard extends ConsumerWidget {
  final PlanOfDayInfo planOfDayInfomation;
  final int index;

  ExerciseCard({required this.planOfDayInfomation, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ListDetailOfDayVm vm = ref.read(listDetailOfDayProvider.notifier);
    ListDetailOfDayPageModel? model = ref.read(listDetailOfDayProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 120,
          child: InkWell(
            onTap: () {
              GlobalData.planId = model.planOfDayInfomationList[index].id;
              Navigator.pushNamed(context, "/plan-detail-page");
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
                          // 운동명
                          '${planOfDayInfomation.fitnessName}',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${planOfDayInfomation.bodyPart}',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 30),
                            Text(
                              '${planOfDayInfomation.repeatCount}kg',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${planOfDayInfomation.setCount}세트',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${planOfDayInfomation.repeatCount}회',
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
                        // 운동 삭제
                        vm.remove(planOfDayInfomation.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
