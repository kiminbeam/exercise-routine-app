import 'package:flutter/material.dart';

class PlanDetailGoals extends StatelessWidget {
  final goalText1;

  final goalNumber;

  final goalText2;

  PlanDetailGoals(
      {required this.goalText1,
      required this.goalNumber,
      required this.goalText2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 4,
        color: Colors.grey,
        child: Center(
          child: Text("$goalText1: $goalNumber$goalText2",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
