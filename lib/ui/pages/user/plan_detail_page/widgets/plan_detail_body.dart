import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_exercise_title.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_explain.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_goals.dart';
import 'package:projectsampledata/ui/pages/user/plan_detail_page/widgets/plan_detail_page_button.dart';

class PlanDetailBody extends StatelessWidget {
  const PlanDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PlanDetailPageButton(),
            ],
          ),
          SizedBox(height: 15),
          PlanDetailExerciseTitle(title: "덤벨 프레스 (Dumbbell Press)"), // 운동명
          SizedBox(height: 15),
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              "",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          PlanDetailExplain(
              explain:
                  "덤벨로 하는 가슴 타겟 운동입니다.\n벤치에 누워 양손에 덤벨을 들고 팔을 90도로 굽혀 \n내렸다가 가슴 위로 뻗어주세요."),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                PlanDetailGoals(
                    goalText1: "세트 수", goalNumber: 4, goalText2: "회"),
                SizedBox(height: 15),
                PlanDetailGoals(
                    goalText1: "반복 횟수", goalNumber: 12, goalText2: "회"),
                SizedBox(height: 15),
                PlanDetailGoals(
                    goalText1: "수행 무게", goalNumber: 16, goalText2: "kg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
