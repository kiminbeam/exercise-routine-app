import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String bodyPart;
  final int setCount;
  final int repeatCount;

  const WorkoutCard({
    required this.title,
    required this.bodyPart,
    required this.setCount,
    required this.repeatCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: InkWell(
        onTap: () {
          // 카드 클릭시 동작
        },
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양옆으로 배치
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
                  mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 가운데 정렬
                  children: [
                    Text(
                      '$title',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$bodyPart',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 30),
                        Text(
                          '$setCount세트',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '$repeatCount회',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),

                // 삭제 버튼
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // 삭제 동작
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
