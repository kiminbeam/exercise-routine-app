import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_vm.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/widgets/user_info_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class UserInfoPage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserInfoModel? userInfoModel = ref.watch(userInfoProvider);

    if (userInfoModel == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: CustomNavigation(scaffoldKey),
        appBar: AppBar(
          title: const Text('사용자 정보'),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Divider(
              thickness: 0.5,
              height: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        body: UserInfoBody(userInfoModel: userInfoModel),
      );
    }
  }
}
