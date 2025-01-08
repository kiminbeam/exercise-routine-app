import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/widgets/user_info_update_body.dart';

import '../../../common_widgets/custom_navigator.dart';

class UserInfoUpdatePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();

  final passwordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomNavigation(scaffoldKey),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "내 정보 수정",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: UserInfoUpdateBody(),
    );
  }
}
