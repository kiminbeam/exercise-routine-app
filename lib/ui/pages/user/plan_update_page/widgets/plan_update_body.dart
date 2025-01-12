import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/plan_detail_vm.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/plan_update_vm.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/widgets/plan_update_button.dart';

import '../../../fitness/fitness_plus_page/widgets/add_fitness_detail_image.dart';
import '../../plan_detail_page/widgets/plan_detail_exercise_title.dart';

class PlanUpdateBody extends ConsumerWidget {
  final planId;
  final PlanDetailModel model;
  PlanUpdateBody({required this.planId, required this.model});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final sets = TextEditingController();
  final repeatCount = TextEditingController();
  final weight = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlanUpdateVM vm = ref.read(planUpdateProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: PlanDetailExerciseTitle(title: model.fitnessName),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: AddFitnessDetailImage(imagePath: '${model.fitnessImg}'),
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: sets,
            labelText: "세트 수 입력",
            hintText: "",
            icon: Icons.edit,
            defaultNumber: '${model.set}',
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: repeatCount,
            labelText: "반복 횟수 입력",
            hintText: "",
            icon: Icons.repeat,
            defaultNumber: '${model.repeat}',
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: weight,
            labelText: "무게 입력",
            hintText: "",
            icon: Icons.fitness_center,
            defaultNumber: '${model.weight / 1000}',
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () {
              // vm으로 이동해서 비즈니스 로직 진행 구현해야 됨.
              vm.updatePlan(planId, sets.text.trim(), repeatCount.text.trim(),
                  weight.text.trim());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "수정완료",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
