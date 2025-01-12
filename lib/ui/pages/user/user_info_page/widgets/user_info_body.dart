import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/gvm/session_gvm.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_vm.dart';

class UserInfoBody extends ConsumerWidget {
  final UserInfoModel userInfoModel;

  UserInfoBody({required this.userInfoModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userWeight;
    String userHeight;

    SessionGvm gvm = ref.read(sessionProvider.notifier);
    if (userInfoModel.weight == 0) {
      userWeight = "등록된 정보가 없습니다.";
    } else {
      userWeight = (userInfoModel.weight / 10).toString() + "kg";
    }
    if (userInfoModel.height == 0) {
      userHeight = "등록된 정보가 없습니다.";
    } else {
      userHeight = (userInfoModel.height / 10).toString() + "cm";
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity, // 부모 Container의 너비를 최대화합니다.
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column의 크기를 자식 크기로 제한합니다.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // 수평 방향 가운데 정렬
          children: [
            SizedBox(
              height: 100,
            ),
            UserInfoBodyWidget(
              text: "사용자 신장 : $userHeight",
              fontSize: 25,
              border: true,
            ),
            SizedBox(
              height: 50,
            ),
            UserInfoBodyWidget(
              text: "사용자 체중 : $userWeight",
              fontSize: 25,
              border: true,
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/user-info-update-page");
                },
                child: UserInfoBodyWidget(
                  text: "회원 정보 수정하기",
                  fontSize: 25,
                )),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                gvm.logout();
              },
              child: UserInfoBodyWidget(
                text: "로그 아웃",
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoBodyWidget extends StatelessWidget {
  String text;
  double fontSize;
  bool border;

  UserInfoBodyWidget(
      {required this.text, this.fontSize = 20, this.border = false});

  @override
  Widget build(BuildContext context) {
    if (border) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        constraints: BoxConstraints(
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          "${text}",
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center, // 이 부분을 추가하여 텍스트를 가운데 정렬합니다.
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(15.0),
        constraints: BoxConstraints(
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          "${text}",
          style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center, // 이 부분을 추가하여 텍스트를 가운데 정렬합니다.
        ),
      );
    }
  }
}
