import 'package:flutter/material.dart';

class AddExerciseDetailImage extends StatelessWidget {
  final imagePath; // 이미지 경로

  AddExerciseDetailImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      // gif 이미지 적용
      // child: Image.asset()),
    );
  }
}
