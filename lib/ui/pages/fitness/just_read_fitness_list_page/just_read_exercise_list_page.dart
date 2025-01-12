import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/fitness/just_read_fitness_list_page/widgets/jr_fitness_list_body.dart';

class JustReadFitnessListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    screenWidth < 400 ? screenHeight * 0.1 : screenHeight * 0.07;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF374056),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          '기본 홈',
          style: TextStyle(color: Colors.white),
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
      body: JrFitnessListBody(
          screenHeight: screenHeight, screenWidth: screenWidth),
    );
  }
}
