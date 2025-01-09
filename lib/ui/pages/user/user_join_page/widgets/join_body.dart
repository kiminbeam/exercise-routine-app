import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';

class JoinBody extends ConsumerWidget {
   JoinBody({
    super.key,
    required this.heightRatio,
  });
  final double heightRatio;
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();
  final _email = TextEditingController();
  final _height = TextEditingController();
  final _weight = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    SessionGvm gvm = ref.read(sessionProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(left: 5),
              child: Text("필수 입력 사항",
                style: TextStyle(fontSize: 16,),
              )),
          SizedBox(
            height: 10,
          ),
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
              controller: _username,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
          SizedBox(
            height: 20,
          ),
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
               controller: _rePassword,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
               controller: _email,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "선택 입력 사항",
                style: TextStyle(
                  fontSize: 16,
                ),
              )),
          SizedBox(
            height: 10,
          ),
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
               controller: _height,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
               controller: _weight,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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

                  gvm.join(_username.text.trim(),_password.text.trim(),_rePassword.text.trim() ,_email.text.trim(), _height.text.trim(),_weight.text.trim());

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
