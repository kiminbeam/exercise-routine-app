import 'package:flutter/material.dart';

class PlanDetailExerciseTitle extends StatelessWidget {
  final title;

  PlanDetailExerciseTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey,
        ),
      ),
    );
  }
}
