// import 'package:flutter/material.dart';
//
// import '../../../../../data/repository/week_information_repository.dart';
//
//
// class UserInfoBodyItem extends StatelessWidget {
//   final WeekInformation weekInformation;
//
//   UserInfoBodyItem({required this.weekInformation});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     List<Exercise> displayList = weekInformation.exerciseList.take(3).toList();
//
//     return Container(
//       height: 100.0,
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 20,
//           ),
//           Text(
//             "${weekInformation.dayOfTheWeek}",
//             style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(width: 40.0),
//           Wrap(
//             spacing: 8.0, // 각 항목 사이의 간격
//             children: displayList
//                 .map((exercise) => Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Text(
//                         "( " + exercise.exerciseName + " ) ",
//                         style: TextStyle(fontSize: 25, color: Colors.grey),
//                       ),
//                     ))
//                 .toList(),
//           ),
//           listSizeCheck(),
//         ],
//       ),
//     );
//   }
//
//   Builder listSizeCheck() {
//     return Builder(
//       builder: (context) {
//         if (weekInformation.exerciseList.length > 3) {
//           return Icon(Icons.more_horiz, size: 40.0, color: Colors.grey);
//         }
//         return SizedBox(
//           width: 0,
//         );
//       },
//     );
//   }
// }
