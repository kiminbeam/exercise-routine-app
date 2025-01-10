import 'package:flutter/material.dart';

class AddFitnessDetailImage extends StatelessWidget {
  final imagePath; // 이미지 경로

  AddFitnessDetailImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      // gif 이미지 적용
      child: Image.asset('${imagePath}', fit: BoxFit.cover,)

    );

  }
}
