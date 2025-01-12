import 'package:flutter/material.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/user_info_update_vm.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/widgets/user_info_update_textfromfield.dart';

class UserInfoUpdateBody extends StatelessWidget {
  final SessionUser sessionUser;
  final UserInfoUpdateVM vm;
  final UpdateForUserInfoModel model;

  UserInfoUpdateBody(this.sessionUser, this.vm, this.model);

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController(text: "${model.email}");
    final _height = TextEditingController(text: "${model.height != 0 ? model.height / 10 : ""}");
    final _weight = TextEditingController(text: "${model.weight != 0 ? model.weight / 10 : ""}");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(height: 40),
          Text("사용자 id : ${sessionUser.username}", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 50),

          Text("사용 중인 이메일 ", style: TextStyle(fontSize: 20,),),
          UserInfoUpdateTextfromfield(
            hint: "이메일 주소 변경..",
            controller: _email,
            icon: Icons.email,
          ),
          SizedBox(height: 35),
          Text("당신의 신장 (cm)", style: TextStyle(fontSize: 20,),),
          UserInfoUpdateTextfromfield(
            hint: "현재 키 입력..",
            controller: _height,
            icon: Icons.straighten,
          ),
          SizedBox(height: 35),
          Text("당신의 몸무게 (kg)", style: TextStyle(fontSize: 20,),),
          UserInfoUpdateTextfromfield(
            hint: "몸무게 입력해 주세요.",
            controller: _weight,
            icon: Icons.monitor_weight,
          ),
          SizedBox(height: 80),
          Container(
            width: double.infinity,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8.0),
              child: TextButton(
                onPressed: () {
                  vm.updateUserInfo(
                      email: _email.text.trim(),
                      height: _height.text.trim(),
                      weight: _weight.text.trim());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "수정하기",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                  foregroundColor: Colors.white,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
