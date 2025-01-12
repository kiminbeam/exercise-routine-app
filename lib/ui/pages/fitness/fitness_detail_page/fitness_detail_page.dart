import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/fitness/fitness_detail_page/widgets/fitness_detail_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class FitnessDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final id;

  FitnessDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("운동정보 상세", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: FitnessDetailBody(id),
    );
  }
}
