import 'package:flutter/material.dart';

class PlanDetailExerciseTitle extends StatelessWidget {
  final title;

  PlanDetailExerciseTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Center(
        child: Text(
          "$title",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
      ),
    );
  }
}
