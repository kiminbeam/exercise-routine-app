import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/user_info_update_vm.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/widgets/user_info_update_body.dart';

import '../../../../data/gvm/session_gvm.dart';
import '../../../common_widgets/custom_navigator.dart';

class UserInfoUpdatePage extends ConsumerWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();

  final passwordCheck = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);

    UserInfoUpdateVM? vm =
        ref.read(userInfoUpdateProvider(sessionUser.id!).notifier);
    UpdateForUserInfoModel? model =
        ref.watch(userInfoUpdateProvider(sessionUser.id!));

    if (vm == null || model == null) {
      return Center(child: CircularProgressIndicator());
    } else {
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
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: UserInfoUpdateBody(sessionUser, vm, model),
      );
    }
  }
}
