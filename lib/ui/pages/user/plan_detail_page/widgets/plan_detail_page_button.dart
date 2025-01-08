import 'package:flutter/material.dart';

import '../../plan_update_page/plan_update_page.dart';

class PlanDetailPageButton extends StatelessWidget {
  const PlanDetailPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanUpdatePage(),
          ),
        );
      },
      child: Text(
        "수정하기",
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
