import 'package:flutter/material.dart';

import '../../plan_update_page/plan_update_page.dart';
import '../plan_detail_vm.dart';

class PlanDetailPageButton extends StatelessWidget {
  final planId;
  final PlanDetailModel model;

  PlanDetailPageButton({required this.planId, required this.model});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanUpdatePage(planId: planId, model: model,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "계획 수정하기",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
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
