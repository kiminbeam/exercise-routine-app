import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_detail_page/widgets/exercise_detail_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class ExerciseDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final id;

  ExerciseDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("운동정보 상세", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ExerciseDetailBody(id),
    );
  }
}
