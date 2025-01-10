import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/plan_update_vm.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/widgets/plan_update_button.dart';

class PlanUpdateBody extends ConsumerWidget {
  final planId;

  PlanUpdateBody({required this.planId});

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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              child: Center(
                child: Text(
                  "운동 계획 수정",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              "assets/강아지_2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: sets,
            labelText: "세트 수 입력",
            hintText: "Ex: 3",
            icon: Icons.edit,
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: repeatCount,
            labelText: "반복 횟수 입력",
            hintText: "Ex: 12",
            icon: Icons.repeat,
          ),
          SizedBox(height: 30),
          PlanUpdateButton(
            controller: weight,
            labelText: "무게 입력",
            hintText: "20",
            icon: Icons.fitness_center,
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              // vm으로 이동해서 비즈니스 로직 진행 구현해야 됨.
              vm.updatePlan(planId, sets.text.trim(), repeatCount.text.trim(),
                  weight.text.trim());
            },
            child: Text(
              "수정하기",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
          ),
        ],
      ),
    );
  }
}
