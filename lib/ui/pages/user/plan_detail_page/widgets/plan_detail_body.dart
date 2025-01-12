import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/plan_detail_vm.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_exercise_title.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_explain.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_goals.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_page_button.dart';

import '../../../fitness/fitness_plus_page/widgets/add_fitness_detail_image.dart';

class PlanDetailBody extends ConsumerWidget {
  final int planId;

  PlanDetailBody({required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlanDetailModel? model = ref.watch(planDetailProvider(planId));

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PlanDetailPageButton(planId: planId),
              ],
            ),
            SizedBox(height: 15),
            PlanDetailExerciseTitle(title: model.fitnessName),
            // 운동명 model.fitnessName
            SizedBox(height: 15),
            AddFitnessDetailImage(imagePath: '${model.fitnessImg}'),
            SizedBox(height: 10),
            PlanDetailExplain(explain: model!.fitnessContent),
            //model.fitnessContent로 가져와야 함
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  PlanDetailGoals(
                      goalText1: "세트 수",
                      goalNumber: model!.set,
                      goalText2: "회"),
                  // goalNumber>> model.set
                  SizedBox(height: 15),
                  PlanDetailGoals(
                      goalText1: "반복 횟수",
                      goalNumber: model!.repeat,
                      goalText2: "회"),
                  // goalNumber>> model.repeat
                  SizedBox(height: 15),
                  PlanDetailGoals(
                      goalText1: "수행 무게",
                      goalNumber: model!.weight,
                      goalText2: "kg"),
                  // goalNumber>> model.weight
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
