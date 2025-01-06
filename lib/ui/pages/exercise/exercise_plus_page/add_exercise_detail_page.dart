import 'package:flutter/material.dart';

class AddExerciseDetailPage extends StatelessWidget {
  final String? selectedExercise; // 선택된 운동명을 외부에서 전달받음
  final String? imageUrl; // 이미지 URL 또는 영상 URL을 외부에서 전달받음

  AddExerciseDetailPage({this.selectedExercise, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('운동 추가')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 동작 추가
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 동작 추가
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 운동명 버튼
            ElevatedButton(
              onPressed: () {
                // 운동명 선택 동작
              },
              child: Text('운동 선택'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 16),

            // 이미지 or 영상 컨테이너 (버튼을 컨테이너로 변경)
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      // 영상일 경우 확장자만 바꾸면되고 이미지일 경우 assets 폴더에 있는 이미지로 바꿈
                      child: imageUrl!.endsWith('.mp4')
                          ? Center(
                              child: Icon(
                                Icons.videocam,
                                size: 50.0,
                                color: Colors.grey[600],
                              ),
                            )
                          : Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    )
                  : Center(
                      // 이미지나 영상을 넣게되면 텍스트 없애기
                      child: Text(
                        '이미지 or 영상',
                        style: TextStyle(fontSize: 18.0, color: Colors.black54),
                      ),
                    ),
            ),
            SizedBox(height: 16),

            // 요일 선택 버튼
            ElevatedButton(
              onPressed: () {
                // 요일 지정 동작
              },
              child: Text('요일 선택'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 16),

            // 세트 수 텍스트
            TextField(
              decoration: InputDecoration(
                labelText: '세트 수 입력',
                suffixText: '세트',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // 반복 횟수 텍스트
            TextField(
              decoration: InputDecoration(
                labelText: '반복 횟수 입력',
                suffixText: '회',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            // 무게 텍스트
            TextField(
              decoration: InputDecoration(
                labelText: '무게 입력',
                suffixText: 'kg',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32),

            // 추가하기 버튼
            ElevatedButton(
              onPressed: () {
                // 추가하기 동작
              },
              child: Text('추가하기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
