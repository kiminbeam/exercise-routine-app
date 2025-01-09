import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectsampledata/ui/pages/main/main_page/main_page.dart';
import 'package:projectsampledata/ui/pages/splash/splash_page.dart';
import 'package:projectsampledata/ui/pages/user/user_join_page/join_page.dart';
import 'package:projectsampledata/ui/pages/user/user_login_page/login_page.dart';

import '_core/constants/theme.dart';

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
        // home: MainPage(),
        routes: {
          "/login": (context) => LoginPage(), // 로그인 페이지
          "/join": (context) => JoinPage(),
          "/main-page": (context) => MainPage(),
        },
        theme: ThemeData(appBarTheme: appBarTheme()) // 정의한 AppBarTheme 적용 ),
        );
  }
}

// 라우팅 필요하면 아래 내용에서 필요한 부분만 알아서 주소 바꾸고 쓰십셔
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       // context가 없는 곳에서 context를 사용할 수 있는 방법
//       debugShowCheckedModeBanner: false,
//       //home: SplashPage(),
//       routes: {
//         "/login": (context) => LoginPage(), // 로그인 페이지
//         "/join": (context) => JoinPage(), // 회원가입 페이지
//         "/exercise-add": (context) => AddExerciseDetailPage(), // 운동 추가 페이지
//         "/day-exercise": (context) => ListDetailOfDayPage(), // 요일별 운동 상세보기
//         "/plan-update": (context) => PlanUpdatePage(), // 요일별 계획 업데이트 페이지
//         "/user-info-update": (context) => UserInfoUpdatePage(), // 유저 정보 수정 페이지
//         "/main-page": (context) => MainPage(), // 메인 페이지 (월화수목금토일)
//         "/user-info": (context) => UserInfoPage(), // 유저 정보 페이지
//         "/exercise-list": (context) => ExerciseListPage(), // 유저 정보 페이지
//       },
//       theme: theme(),
//     );
//   }
// }
