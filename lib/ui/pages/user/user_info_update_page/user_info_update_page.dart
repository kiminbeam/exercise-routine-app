import 'package:flutter/material.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/widgets/user_info_update_body.dart';

class UserInfoUpdatePage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();

  final passwordCheck = TextEditingController();

  // Form의 상태를 관리하는 GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "내 정보 수정",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            UserInfoUpdateBody(
                controller: username, labelText: "ID 입력", icon: Icons.person),
            SizedBox(height: 25),
            UserInfoUpdateBody(
              controller: password,
              labelText: "비밀번호 입력",
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 25),
            UserInfoUpdateBody(
              controller: passwordCheck,
              labelText: "비밀번호 확인",
              icon: Icons.lock,
              obscureText: true,
              pwController: password, // 비밀번호랑 비교, 확인
            ),
            SizedBox(height: 25),
            UserInfoUpdateBody(
                controller: email, labelText: "이메일 주소 변경..", icon: Icons.email),
            SizedBox(height: 25),
            UserInfoUpdateBody(
                controller: height,
                labelText: "현재 키 입력..",
                icon: Icons.straighten),
            SizedBox(height: 25),
            UserInfoUpdateBody(
                controller: weight,
                labelText: "몸무게 입력해 주세요.",
                icon: Icons.monitor_weight),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8.0),
                  child: TextButton(
                    onPressed: () {
                      // // 폼 검증 vm에서 해야함
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   // 비밀번호 확인 및 수정 작업 진행
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('정보가 수정되었습니다.')),
                      //   );
                      //   // 실제 수정 작업 코드를 여기에 추가하면 됩니다.
                      // }
                      fetch(username.text, password.text, email.text,
                          height.text, weight.text);
                    },
                    child: Text("수정하기",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void fetch(
    String username, String pw, String email, String height, String weight) {
  print("$username");
  print("$pw");
  print("$email");
  print("$height");
  print("$weight");
}
