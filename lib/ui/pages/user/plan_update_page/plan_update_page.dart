import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/widgets/plan_update_body.dart';

import '../../../common_widgets/custom_navigator.dart';
import '../plan_detail_page/plan_detail_vm.dart';

class PlanUpdatePage extends StatelessWidget {
  final planId;
  final PlanDetailModel model;
  PlanUpdatePage({required this.planId, required this.model});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("계획 수정", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PlanUpdateBody(planId: planId, model: model,),
    );
  }
}
