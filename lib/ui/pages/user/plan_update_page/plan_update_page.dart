import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/plan_update_page/widgets/plan_update_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class PlanUpdatePage extends StatelessWidget {
  final planId;

  PlanUpdatePage({required this.planId});

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
      ),
      body: PlanUpdateBody(planId: planId),
    );
  }
}
