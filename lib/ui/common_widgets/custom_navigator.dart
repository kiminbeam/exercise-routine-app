import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/data/global_data/global_data.dart';

import '../../data/gvm/session_gvm.dart';

class CustomNavigation extends ConsumerWidget {
  final scaffoldKey;

  const CustomNavigation(this.scaffoldKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SessionGvm gvm = ref.read(sessionProvider.notifier);
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/main-page");
                },
                child: const Text(
                  "주간 계획",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  // 페이지 이동
                  Navigator.popAndPushNamed(context, "/user-info-page");
                },
                child: const Text(
                  "마이페이지",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  GlobalData.isFitnessPlus = false;
                  Navigator.popAndPushNamed(context, "/fitness-list-page");
                },
                child: const Text(
                  "모든 운동 열람",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  gvm.logout();
                },
                child: const Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
