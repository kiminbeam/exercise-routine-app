import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_join_page/widgets/join_body.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double heightRatio = deviceHeight / 812;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, "/join");
          },
        ),
        title: Container(
          child: Text(
            "회원가입",
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
      body: JoinBody(heightRatio: heightRatio),
    );
  }
}
