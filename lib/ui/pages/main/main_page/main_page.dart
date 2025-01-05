import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/main/main_page/main_page_vm.dart';
import '../../../common_widgets/custom_navigator.dart';
import 'widgets/main_body.dart';

class MainPage extends ConsumerWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainPageModel? mainPageModel = ref.read(mainPageProvider);

    if (mainPageModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        endDrawer: CustomNavigation(scaffoldKey),
        appBar: AppBar(
          title: const Text('기본 홈'),
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


