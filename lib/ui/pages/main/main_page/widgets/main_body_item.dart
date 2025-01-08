import 'package:flutter/material.dart';

import '../main_page_vm.dart';

class MainBodyItem extends StatelessWidget {
  final MainPageWeekInfo weekInformation;

  MainBodyItem({required this.weekInformation});

  @override
  Widget build(BuildContext context) {
    int printCount = 0;

    double screenWidth = MediaQuery.of(context).size.width;

    // 시간 날 때 아래 조건문 > 화면 크기에 따라 값을 도출해주는 메서드로 분리
    printCount = screenWidthCalculate(screenWidth, printCount);

    List<String> displayList =
        weekInformation.fitnessList.take(printCount).toList();
    return InkWell(
      onTap: () {
        print("${weekInformation.dayOfWeek}요일 버튼 클릭됨");
      },
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(20.0),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black, width: 2),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // 수직 가운데 정렬
          children: [
            SizedBox(width: 20),
            Text(
              "${weekInformation.dayOfWeek}",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
            const SizedBox(width: 40.0),
            Container(
              child: Row(
                children: [
                  Wrap(
                    spacing: 8.0, // 각 항목 사이의 간격
                    children: displayList
                        .map(
                          (fitness) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "( " + fitness + " ) ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.grey),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  listSizeCheck(printCount),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int screenWidthCalculate(double screenWidth, int printCount) {
    if (screenWidth >= 300) {
      printCount = 1;
    }
    if (screenWidth >= 400) {
      printCount = 2;
    }
    if (screenWidth >= 500) {
      printCount = 3;
    }
    if (screenWidth >= 600) {
      printCount = 4;
    }
    if (screenWidth >= 700) {
      printCount = 5;
    }
    if (screenWidth >= 800) {
      printCount = 6;
    }
    return printCount;
  }

  Builder listSizeCheck(int printCount) {
    return Builder(
      builder: (context) {
        if (weekInformation.fitnessList.length > printCount) {
          return Icon(Icons.more_horiz, size: 40.0, color: Colors.grey);
        }
        return SizedBox(
          width: 0,
        );
      },
    );
  }
}
