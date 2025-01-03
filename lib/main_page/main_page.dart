import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/main_page_vm.dart';

import '../data/week_information_repository.dart';
import 'components/week_item.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<WeekInformation> list = ref.read(weekInformationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('기본 홈'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.list_dash)),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(
            thickness: 0.5,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView.builder(
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
                        border: Border.all(color: Colors.black, width: 4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: WeekItem(
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
      ),
    );
  }
}
