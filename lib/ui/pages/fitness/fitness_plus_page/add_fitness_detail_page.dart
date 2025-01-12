import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/common_widgets/custom_navigator.dart';
import 'package:projectsampledata/ui/pages/fitness/fitness_plus_page/widgets/add_fitness_detail_body.dart';

class AddFitnessDetailPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _fitnessId;
  final _dayOfWeek;
  AddFitnessDetailPage(this._fitnessId, this._dayOfWeek);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: CustomNavigation(scaffoldKey), // 메뉴바
      appBar: AppBar(
        title: Center(
          child: Text(
            '운동 추가',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 동작 추가
          },
        ),
      ),
    body: AddFitnessDetailBody(_fitnessId, _dayOfWeek),
    );
  }
}
