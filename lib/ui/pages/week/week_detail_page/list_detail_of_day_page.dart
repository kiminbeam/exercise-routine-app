// StatelessWidget 일때

import 'package:flutter/material.dart';

class ListDetailOfDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기 동작
          },
        ),
        title: Center(child: Text('요일')),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 메뉴 동작
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 추가하기 버튼
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // 운동 추가 동작
              },
              icon: Icon(Icons.add),
              label: Text('추가하기'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                backgroundColor: Colors.grey[400],
              ),
            ),
          ),
          // 운동 리스트
          Expanded(
            child: ListView(
              children: [
                // 임시 문자열과 숫자로 해놓고 데이터베이스 확실해지면 바꾸기
                WorkoutCard(title: '운동명', bodyPart: '부위', sets: 3, repeats: 15),
                WorkoutCard(title: '운동명', bodyPart: '부위', sets: 4, repeats: 12),
                WorkoutCard(title: '운동명', bodyPart: '부위', sets: 2, repeats: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String bodyPart;
  final int sets;
  final int repeats;

  const WorkoutCard({
    required this.title,
    required this.bodyPart,
    required this.sets,
    required this.repeats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양옆으로 배치
          children: [
            // 왼쪽 영역: 운동명과 부위
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4), // 간격
                Text(
                  '$bodyPart',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            // 오른쪽 영역: 세트 수와 반복횟수
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$sets세트',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '$repeats회',
                  style: TextStyle(fontSize: 14),
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
    );
  }
}

// StatefulWidget일때 (위의 코드 수정해놓은거 확인하고 이것도 수정하기)

// import 'package:flutter/material.dart';

// class ListDetailOfDay extends StatefulWidget {
//   @override
//   _ListDetailOfDayState createState() => _ListDetailOfDayState();
// }

// // 이 메서드는 추가하기 버튼을 눌렀을 때 넘어갈 화면 연결되면 없어질것
// class _ListDetailOfDayState extends State<ListDetailOfDay> {
//   // 운동 리스트를 상태로 관리
//   List<Map<String, String>> workouts = [];

//   void _addWorkout() {
//     setState(() {
//       workouts.add({
//         // 임시 문자열로 두고 후에 데이터베이스 확실해지면 바꾸기
//         'title': '운동명',
//         'bodyPart': '부위',
//         'sets': '3세트',
//         'reps': '12회',
//       });
//     });
//   }

//   // 휴지통 버튼 누르면 삭제
//   void _removeWorkout(int index) {
//     setState(() {
//       workouts.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigator.pop(context); // 뒤로 가기 동작(화면 정해지면 주석 풀기)
//           },
//         ),
//         title: Center(child: Text('요일')), // 요일 표시 중앙에 둠
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               // 메뉴 동작
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 추가하기 버튼
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton.icon(
//               onPressed: _addWorkout, // 운동 추가
//               icon: Icon(Icons.add),
//               label: Text('추가하기'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//                 backgroundColor: Colors.grey[400],
//               ),
//             ),
//           ),
//           // 운동 리스트
//           Expanded(
//             child: ListView.builder(
//               itemCount: workouts.length,
//               itemBuilder: (context, index) {
//                 final workout = workouts[index];
//                 return WorkoutCard(
//                   title: workout['title']!,
//                   bodyPart: workout['bodyPart']!,
//                   sets: workout['sets']!,
//                   reps: workout['reps']!,
//                   onDelete: () => _removeWorkout(index), // 삭제 콜백
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class WorkoutCard extends StatelessWidget {
//   final String title; // 운동명
//   final String bodyPart; // 타겟 부위
//   final String sets; // 세트 수
//   final String reps; // 반복 횟수
//   final VoidCallback onDelete; // 삭제 콜백

//   const WorkoutCard({
//     required this.title,
//     required this.bodyPart,
//     required this.sets,
//     required this.reps,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       child: ListTile(
//         leading: Text(
//           title,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         title: Text('$bodyPart  $sets  $reps'),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: onDelete, // 삭제 동작
//         ),
//       ),
//     );
//   }
// }
