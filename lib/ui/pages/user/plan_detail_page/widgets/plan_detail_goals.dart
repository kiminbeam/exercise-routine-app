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
      width: double.infinity,
      child: Card(
        elevation: 4,
        color: Colors.grey[50],
        child: Center(
          child: Text("$goalText1: $goalNumber$goalText2",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
