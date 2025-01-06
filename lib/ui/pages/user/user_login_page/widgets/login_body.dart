import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.heightRatio,
    required this.widthRatio,
  });

  final double heightRatio;
  final double widthRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: heightRatio * 22,
            ),
            width: widthRatio * 20,
            height: heightRatio * 52,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "아이디를 입력하세요.",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: heightRatio * 22,
            ),
            width: widthRatio * 20,
            height: heightRatio * 52,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "비밀번호를 입력하세요.",
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                contentPadding: EdgeInsets.only(left: 10),),
              // controller: ,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightRatio * 22),
            width: widthRatio * 20,
            height: heightRatio * 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: heightRatio * 22),
            width: widthRatio * 20,
            height: heightRatio * 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
