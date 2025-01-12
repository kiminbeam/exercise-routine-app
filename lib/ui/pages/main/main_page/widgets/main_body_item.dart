import 'package:flutter/material.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';

import '../main_page_vm.dart';

class MainBodyItem extends StatefulWidget {
  final MainPageWeekInfo mainPageWeekInfo;
  final MainPageVM mainPageVM;
  MainBodyItem({required this.mainPageWeekInfo, required this.mainPageVM});

  @override
  _MainBodyItemState createState() => _MainBodyItemState();
}

class _MainBodyItemState extends State<MainBodyItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var (count, text) = screenWidthCalculate(screenWidth, widget.mainPageWeekInfo.fitnessList);

    return InkWell(
      onTap: () {
        GlobalData.dayOfWeekName = widget.mainPageWeekInfo.dayOfWeek;
        Navigator.pushNamed(context, "/list-detail-of-day-page");
      },
      child: Card(
        elevation: 4,
        child: Container(
          height: 100.0,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!(count == 1 && text == '등록된 정보가 없습니다'))
                Checkbox(
                  value: widget.mainPageWeekInfo.isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.mainPageWeekInfo.isChecked = value!;
                      // 여기에서 mainPageVM의 메서드를 호출합니다.
                      GlobalData.dayOfWeekName = widget.mainPageWeekInfo.dayOfWeek;
                      widget.mainPageVM.updateWeekStatus(value);
                    });
                  },
                ),

              SizedBox(width: 20),
              Text(
                "${widget.mainPageWeekInfo.dayOfWeek}",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              const SizedBox(width: 20.0),
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
      ),
    );
  }

  (int, String) screenWidthCalculate(
      double screenWidth, List<String> fitnessList) {
    int maxPrintAvailable = ((screenWidth - 250) / 100 * 7).floor();
    String text = "";
    int count = 0;
    bool notOverFlow = true;
    for (int j = 0; j < fitnessList.length && notOverFlow; j++) {
      for (int i = 0; i < fitnessList[j].length; i++) {
        text = text + fitnessList[j][i];
        if (text.length == maxPrintAvailable) {
          notOverFlow = false;
          break;
        }
      }
      if (notOverFlow) {
        count++;
        if (text.length + 2 < maxPrintAvailable && j != fitnessList.length - 1) {
          text = text + ", ";
        }
      }
    }

    if (text.isEmpty) {
      text = "등록된 정보가 없습니다";
    }

    return (count, text);
  }

  Builder listSizeCheck(int printCount) {
    return Builder(builder: (context) {
      if (widget.mainPageWeekInfo.fitnessList.length > printCount) {
        return Icon(Icons.more_horiz, size: 40.0, color: Colors.grey);
      }
      return SizedBox(
        width: 0,
      );
    });
  }
}
