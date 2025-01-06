import 'package:flutter/material.dart';

class UserInfoUpdateBody extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText; // 비밀번호 입력을 위한 숨김 처리 여부
  final TextEditingController? pwController; // 비밀번호 필드와 비교할 컨트롤러

  UserInfoUpdateBody({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.pwController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
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
        prefixIcon: Icon(icon, color: Colors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "이 필드는 비워둘 수 없습니다.";
        }
        if (pwController != null && controller != pwController) {
          // 비밀번호 확인이 필요한 필드에서만 비교 실시
          if (controller.text != pwController!.text) {
            return "비밀번호가 일치하지 않습니다.";
          }
        }
        return null;
      },
    );
  }
}
