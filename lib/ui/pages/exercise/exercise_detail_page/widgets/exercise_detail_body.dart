import 'package:flutter/material.dart';

class ExerciseDetailBody extends StatelessWidget {
  const ExerciseDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Image.asset(
            "assets/강아지_2.jpg",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "운동 설명",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "fitnessExplain",
                style: TextStyle(
                  fontSize: 16.0, // 글자 크기
                  color: Colors.black87, // 텍스트 색상
                  fontWeight: FontWeight.normal, // 텍스트 굵기
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
