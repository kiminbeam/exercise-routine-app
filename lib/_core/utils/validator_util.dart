import 'package:validators/validators.dart';

Function validateUsername() {
  return (String? value) {

    if (value!.isEmpty) {
      return "유저네임에 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "유저네임의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateExerciseSet() {
  return (String? value) {
    if (value!.isEmpty) {
      return "세트를 입력해주세요.";
    } else if (int.tryParse(value) == null) {
      return "세트를 잘못입력하였습니다.";
    } else if(int.tryParse(value)!<=0){
      return "세트는 0보다 커야함.";
    }else {
      return null;
    }
  };
}

Function validateRepeat() {
  return (String? value) {
    if (value!.isEmpty) {
      return "반복횟수 입력해주세요.";
    } else if (int.tryParse(value) == null) {
      return "반복횟수 잘못입력하였습니다.";
    } else if(int.tryParse(value)!<=0){
      return "반복횟수는 0보다 커야함.";
    }else{
      return null;
    }
  };
}

Function validateWeight() {
  return (String? value) {
    if (value!.isEmpty) {
      return "무게를 입력해주세요.";
    } else if (double.tryParse(value) == null) {
      return "무게를 잘못입력하였습니다.";
    } else if(double.tryParse(value)!<=0.0){
      return "무게는 0이상.";
    }else return null;
  };
}