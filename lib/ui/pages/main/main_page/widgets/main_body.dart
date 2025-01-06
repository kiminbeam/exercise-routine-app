import 'package:flutter/material.dart';

import '../../../../../data/repository/week_info_repository.dart';
import 'main_body_item.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({
    super.key,
    required this.list,
  });

  final List<WeekInformation> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 회색으로 설정
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 60, bottom: 60),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Card(
                  color: Colors.pink[50], // Card의 배경색을 회색으로 설정
                  shape: RoundedRectangleBorder(
                    // side: BorderSide(
                    //   color: Colors.white, // 테두리 색상
                    //   width: 2.0, // 테두리 두께
                    // ),
                    borderRadius: BorderRadius.circular(10.0), // 라운드 처리된 테두리
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: MainBodyItem(
                            weekInformation: list[index],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
