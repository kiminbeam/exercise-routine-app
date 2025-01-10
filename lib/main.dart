import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/main/main_page/main_page.dart';
import 'package:projectsampledata/ui/pages/splash/splash_page.dart';
import 'package:projectsampledata/ui/pages/user/user_info_page/user_info_page.dart';
import 'package:projectsampledata/ui/pages/user/user_info_update_page/user_info_update_page.dart';
import 'package:projectsampledata/ui/pages/user/user_join_page/join_page.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/login_page.dart';
import 'package:projectsampledata/ui/pages/week/week_detail_page/list_detail_of_day_page.dart';

import '_core/constants/theme.dart';
import 'data/global_data/click_week.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: {
          "/login": (context) => LoginPage(), // 로그인 페이지
          "/join": (context) => JoinPage(),
          "/main-page": (context) => MainPage(),
          "/user-info-page": (context) => UserInfoPage(),
          "/list-detail-of-day-page": (context) =>
              ListDetailOfDayPage(ClickWeek.dayOfWeekName),
          "/user-info-update-page": (context) => UserInfoUpdatePage(),
        },
        theme: ThemeData(appBarTheme: appBarTheme()) // 정의한 AppBarTheme 적용
        );
  }
}
