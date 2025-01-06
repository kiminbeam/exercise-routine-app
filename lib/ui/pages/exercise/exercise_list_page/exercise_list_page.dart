import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/exercise/exercise_list_page/widgets/exercise_list_body.dart';

class ExerciseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = screenWidth < 400 ? 5 / 2 : 5 / 1.57;
    double minHeight1 =
        screenWidth < 400 ? screenHeight * 0.1 : screenHeight * 0.07;
    return Scaffold(
      body: ExerciseListBody(
          minHeight1: minHeight1,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          aspectRatio: aspectRatio),
    );
  }
}
