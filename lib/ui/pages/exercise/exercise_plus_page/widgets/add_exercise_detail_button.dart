import 'package:flutter/material.dart';

class AddExerciseDetailButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // 추가하기 동작
      },
      child: Text(
        '추가하기',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.grey[600],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
    );
  }
}
