import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/widgets/plan_update_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class PlanUpdatePage extends StatelessWidget {
  final planId;

  PlanUpdatePage({required this.planId});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final sets = TextEditingController();
  final repeatCount = TextEditingController();
  final weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("계획 수정", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
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
            PlanUpdateBody(
              controller: sets,
              labelText: "세트 수 입력",
              hintText: "Ex: 3",
              icon: Icons.edit,
            ),
            SizedBox(height: 30),
            PlanUpdateBody(
              controller: repeatCount,
              labelText: "반복 횟수 입력",
              hintText: "Ex: 12",
              icon: Icons.repeat,
            ),
            SizedBox(height: 30),
            PlanUpdateBody(
              controller: weight,
              labelText: "무게 입력",
              hintText: "20",
              icon: Icons.fitness_center,
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // vm으로 이동해서 비즈니스 로직 진행 구현해야 됨.
                fetch(sets.text, repeatCount.text, weight.text);
              },
              child: Text(
                "수정하기",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

void fetch(String sets, String repeatCount, String weight) {
  print("받은 세트 수: $sets");
  print("받은 반복 횟수: $repeatCount");
  print("받은 무게 : $weight");
}
