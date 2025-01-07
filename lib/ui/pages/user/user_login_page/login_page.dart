import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double heightRatio = deviceHeight / 812;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
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
