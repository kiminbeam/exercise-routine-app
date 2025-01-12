import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/fitness/fitness_list_page/widgets/fitness_list_body.dart';

import '../../../../data/global_data/global_data.dart';
import '../../../common_widgets/custom_navigator.dart';

class FitnessListPage extends StatelessWidget {

  bool isFitnessPlus;

  FitnessListPage(this.isFitnessPlus);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // double aspectRatio = screenWidth < 400 ? 5 / 2 : 5 / 1.57;
    // double aspectRatio = screenWidth < 500 ? 5 / 2 : 5 / 2;
    screenWidth < 400 ? screenHeight * 0.1 : screenHeight * 0.07;
    String text;
    if (isFitnessPlus) {
      text = "운동 추가 (${GlobalData.dayOfWeekName}요일)";
    } else {
      text = "모든 운동 리스트";
    }
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${text}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(
            thickness: 0.5,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      body:
          FitnessListBody(screenHeight: screenHeight, screenWidth: screenWidth),
    );
  }
}
