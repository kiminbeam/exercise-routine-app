import 'package:flutter/material.dart';

import '../../../../../data/repository/week_information_repository.dart';
import 'main_body_item.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({
    super.key,
    required this.list,
  });

  final List<WeekInformation> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 60, bottom: 60),
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
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
          ],
        );
      },
      itemCount: list.length,
    );
  }
}