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

  // 사용자 정보 수정 페이지 진입 시, 해당 유저 정보 가져오는 메서드
  Future<void> init() async {
    // 통신을 통해서 해당 유저 정보 가져 오기

    // 가져온 유저 정보를 상태에 등록
    return;
  }

  // 수정하기 버튼 클릭 시 >> 수정 요청 보내는 메서드
  Future<void> updateUserInfo() async {
    // 변수로 받은 데이터를 Map으로 파싱

    // 통신을 통해서, 사용자 정보 수정 요청 보내기 (Map 데이터)

    // 상태가 200이 아닐 경우 처리 메서드 (스넥바 사용)

    // 통신이 정상적으로 이루어 졌을 경우, 상태 업데이트 시키기, userInfoPage -> VM
  }
}
