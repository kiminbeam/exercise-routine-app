import 'package:flutter/material.dart';

import '../main_page_vm.dart';
import 'main_body_item.dart';

class MainPageBody extends StatelessWidget {
  MainPageBody({
    super.key,
    required this.list,
    required this.mainPageVM,
  });

  final List<MainPageWeekInfo> list;
  final MainPageVM mainPageVM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "매주 월요일마다 기록이 저장됩니다.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 60),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    children: [
                      Card(
                        color: Colors.grey[0],
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
                                  mainPageWeekInfo: list[index],
                                  mainPageVM: mainPageVM,
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
          ),
        ],
      ),
    );
  }
}
