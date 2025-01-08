import 'package:flutter/material.dart';

class PlanDetailExplain extends StatelessWidget {
  final explain;

  PlanDetailExplain({required this.explain});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("운동 설명",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            "$explain",
            style: TextStyle(
              fontSize: 16.0, // 글자 크기
              color: Colors.black87, // 텍스트 색상
              fontWeight: FontWeight.normal, // 텍스트 굵기
            ),
          ),
        ],
      ),
    );
  }
}
