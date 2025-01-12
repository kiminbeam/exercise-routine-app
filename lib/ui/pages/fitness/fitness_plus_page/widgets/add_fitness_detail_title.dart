import 'package:flutter/material.dart';

class AddFitnessDetailTitle extends StatelessWidget {
  final exerciseName; // 운동명

  AddFitnessDetailTitle({required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        // 후에 운동명 필드 적용하기
        child: Text(
          '$exerciseName',
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
