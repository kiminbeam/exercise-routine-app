import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateForUserInfo {
  //copyWith
}

final userInfoUpdateProvider = NotifierProvider<UserInfoUpdateVM, int>(() {
  return UserInfoUpdateVM();
});

class UserInfoUpdateVM extends Notifier<int> {
  @override
  int build() {
    init(); // 현재 유저 id 통해서 사용자 정보 가져 와야 한다
    return 0;
  }

  Future<void> init() async {
    // 통신을 통해서 해당 유저 정보 가져 오기
    return;
  }
}
