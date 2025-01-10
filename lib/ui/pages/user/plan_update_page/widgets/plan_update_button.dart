import 'package:flutter/material.dart';

class PlanUpdateButton extends StatelessWidget {
  final TextEditingController controller;

  final String labelText;

  final String hintText;

  final IconData icon;

  PlanUpdateButton(
      {required this.controller,
      required this.labelText,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
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
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
