import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_list_page/fitness_list_page.dart';

class ListDetailOfDayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // 운동 리스트 페이지로 넘기기
        // 새로운 화면으로 넘어가는 것이므로 Navigator.push 적용함
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => FitnessListPage()));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.add,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            '추가하기',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
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
