import 'package:flutter/material.dart';

class UserInfoUpdateTextfromfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final String initValue;

  const UserInfoUpdateTextfromfield({
    Key? key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    this.initValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (initValue.isNotEmpty) {
      controller.text = initValue;
    }
    return Container(
      // elevation: 4,
      // borderRadius: BorderRadius.circular(8.0),
      //color: Colors.white,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: "$hint",
          enabledBorder: OutlineInputBorder(
            // 3. 기본 TextFormField 디자인
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            // 4. 손가락 터치시 TextFormField 디자인
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            // 5. 에러발생시 TextFormField 디자인
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // 5. 에러가 발생 후 손가락을 터치했을 때 TextFormField 디자인
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
//
// class UserInfoUpdateTextfromfield extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData icon;
//   final bool obscureText; // 비밀번호 입력을 위한 숨김 처리 여부
//   final TextEditingController? pwController; // 비밀번호 필드와 비교할 컨트롤러
//
//   UserInfoUpdateTextfromfield({
//     required this.controller,
//     required this.labelText,
//     required this.icon,
//     this.obscureText = false,
//     this.pwController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 4,
//       borderRadius: BorderRadius.circular(8.0),
//       color: Colors.white,
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(
//               color: Colors.blueAccent,
//               width: 2.0,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(
//               color: Colors.grey,
//               width: 1.0,
//             ),
//           ),
//           prefixIcon: Icon(icon, color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }
