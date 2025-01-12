import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/user_recode_page/user_recode_vm.dart';
import 'package:projectsampledata/ui/pages/user/user_recode_page/widgets/user_recode_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class UserRecodePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    var userRecodeModel = ref.watch(userRecodeProvider);

    if (userRecodeModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {

      return Scaffold(
        key: scaffoldKey,
        endDrawer: CustomNavigation(scaffoldKey),
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            '운동 기록',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
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
        body: UserRecodeBody(userRecodeModel: userRecodeModel),
      );
    }
  }
}
