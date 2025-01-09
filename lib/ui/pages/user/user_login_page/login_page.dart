import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/widgets/login_body.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double heightRatio = deviceHeight / 812;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          child: Text(
            "로그인",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),

      body: LoginBody(heightRatio: heightRatio),
    );
  }
}
