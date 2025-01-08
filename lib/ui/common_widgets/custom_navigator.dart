import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavigation extends ConsumerWidget {
  final scaffoldKey;

  const CustomNavigation(this.scaffoldKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              TextButton(
                onPressed: () {
                  print("마이페이지 클릭됨");
                  //scaffoldKey.currentState!.openEndDrawer();
                  //Navigator.pushNamed(context, "/post/write");
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
                  // 햄버거 수동으로 닫아주기
                  // scaffoldKey.currentState?.openEnDrawer();
                  // Navigator.popAndPushNamed(scaffoldKey.cuurentContext!, "/login");
                  print("주간 계획 클릭됨");
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
                  print("모든 운동 열람 클릭됨");
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
