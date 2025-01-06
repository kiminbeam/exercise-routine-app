import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double widthRatio = deviceWidth / 375;
    double heightRatio = deviceHeight / 812;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
        title: Container(
          margin: EdgeInsets.only(left: widthRatio * 104),
          child: Text(
            "로그인",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: LoginBody(heightRatio: heightRatio, widthRatio: widthRatio),
    );
  }
}
