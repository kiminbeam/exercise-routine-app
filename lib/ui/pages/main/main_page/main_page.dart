import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/main/main_page/main_page_vm.dart';

import '../../../common_widgets/custom_navigator.dart';
import 'widgets/main_body.dart';

class MainPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    MainPageModel? mainPageModel = ref.watch(mainPageProvider);

    if (mainPageModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: CustomNavigation(scaffoldKey),
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            '주간 계획',
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
        body: MainPageBody(list: mainPageModel.weekInformationList),
      );
    }
  }
}
