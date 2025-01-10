import 'package:flutter/material.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';

import '../main_page_vm.dart';

class MainBodyItem extends StatelessWidget {
  final MainPageWeekInfo weekInformation;

  MainBodyItem({required this.weekInformation});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var (count, text) =
        screenWidthCalculate(screenWidth, weekInformation.fitnessList);

    return InkWell(
      onTap: () {
        GlobalData.dayOfWeekName = weekInformation.dayOfWeek;
        Navigator.pushNamed(context, "/list-detail-of-day-page");
      },
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  listSizeCheck(count),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  (int, String) screenWidthCalculate(
      double screenWidth, List<String> fitnessList) {
    int maxPrintAvailabe = ((screenWidth - 250) / 100 * 7).floor();
    String text = "";
    int count = 0;
    bool notOverFlow = true;
    for (int j = 0; j < fitnessList.length && notOverFlow; j++) {
      for (int i = 0; i < fitnessList[j].length; i++) {
        text = text + fitnessList[j][i];
        if (text.length == maxPrintAvailabe) {
          notOverFlow = false;
          break;
        }
      }
      if (notOverFlow) {
        count++;
        if (text.length + 2 < maxPrintAvailabe && j != fitnessList.length - 1) {
          text = text + ", ";
        }
      }
    }

    return (count, text);
  }

  Builder listSizeCheck(int printCount) {
    return Builder(builder: (context) {
      if (weekInformation.fitnessList.length > printCount) {
        return Icon(Icons.more_horiz, size: 40.0, color: Colors.grey);
      }
      return SizedBox(
        width: 0,
      );
    });
  }
}
