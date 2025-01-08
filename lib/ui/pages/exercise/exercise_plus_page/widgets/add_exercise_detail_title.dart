import 'package:flutter/material.dart';

class AddExerciseDetailTitle extends StatelessWidget {
  final title; // 운동명

  AddExerciseDetailTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // 후에 운동명 필드 적용하기
        child: Text(
          '$title',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
