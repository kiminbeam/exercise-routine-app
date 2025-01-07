import 'package:flutter/material.dart';

class JoinBody extends StatelessWidget {
  const JoinBody({
    super.key,
    required this.heightRatio,
  });

  final double heightRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.grey),
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
          SizedBox(height: 20,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
                hintText: "비밀번호를 입력하세요.",
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          SizedBox(height: 20,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
                hintText: "비밀번호를 다시 입력하세요.",
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          SizedBox(height: 20,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.grey),
                hintText: "이메일을 입력하세요.",
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          SizedBox( height: 30,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.straighten, color: Colors.grey),
                hintText: "신장을 입력하세요.",
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          SizedBox(height: 20,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                prefixIcon: Icon(Icons.fitness_center, color: Colors.grey),
                hintText: "몸무게를 입력하세요.",
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                contentPadding: EdgeInsets.only(left: 10),
              ),
              // controller: ,
            ),
          ),
          SizedBox(height: 20,),
          Material(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            elevation: 4,
            child: Container(
              height: heightRatio * 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
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
          ),
        ],
      ),
    );
  }
}
