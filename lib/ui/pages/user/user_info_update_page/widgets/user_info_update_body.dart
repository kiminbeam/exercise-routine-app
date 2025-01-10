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
    final _height = TextEditingController(text: "${model.height}");
    final _weight = TextEditingController(text: "${model.weight}");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(height: 40),
          Text("id : ${sessionUser.id}"),
          SizedBox(height: 25),
          UserInfoUpdateTextfromfield(
            hint: "이메일 주소 변경..",
            controller: _email,
            icon: Icons.email,
          ),
          SizedBox(height: 25),
          UserInfoUpdateTextfromfield(
            hint: "현재 키 입력..",
            controller: _height,
            icon: Icons.straighten,
          ),
          SizedBox(height: 25),
          UserInfoUpdateTextfromfield(
            hint: "몸무게 입력해 주세요.",
            controller: _weight,
            icon: Icons.monitor_weight,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(8.0),
                child: TextButton(
                  onPressed: () {
                    vm.updateUserInfo(
                        email: _email.text.trim(),
                        height: _height.text.trim(),
                        weight: _weight.text.trim());
                  },
                  child: Text(
                    "수정하기",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
            ],
          ),
        ],
      ),
    );
  }
}
