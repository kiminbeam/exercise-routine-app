import 'package:flutter/material.dart';

class AddExerciseDetailBody extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String suffixText;
  final IconData icon;

  AddExerciseDetailBody({
    required this.controller,
    required this.labelText,
    required this.suffixText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffixText: suffixText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}
