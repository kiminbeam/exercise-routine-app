import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';

class LoginBody extends ConsumerWidget {
  final double heightRatio;
   LoginBody({
    super.key,
    required this.heightRatio,
  });

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SessionGvm gvm = ref.read(sessionProvider.notifier);

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: [
            Material(
              elevation: 4,
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
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
                controller: _username,
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
               controller: _password,
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
                onPressed: () {
                      gvm.login(_username.text.trim(), _password.text.trim());
                },
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
                onPressed: () {
                   Navigator.pushNamed(context, "/join");
                },
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
