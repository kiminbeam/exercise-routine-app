import 'package:flutter/material.dart';

class UserInfoUpdateTextfromfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText; // 비밀번호 입력을 위한 숨김 처리 여부
  final TextEditingController? pwController; // 비밀번호 필드와 비교할 컨트롤러

  UserInfoUpdateTextfromfield({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.pwController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      child: TextFormField(
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
      ),
    );
  }
}
