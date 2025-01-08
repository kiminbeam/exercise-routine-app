import 'package:flutter/material.dart';

import '../main_page_vm.dart';
import 'main_body_item.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({
    super.key,
    required this.list,
  });

  final List<MainPageWeekInfo> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 60),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white, // 테두리 색상
                      width: 1.0, // 테두리 두께
                    ),
                    borderRadius: BorderRadius.circular(10.0), // 라운드 처리된 테두리
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: MainBodyItem(
                            weekInformation: list[index],
                          ),
                        ),
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
