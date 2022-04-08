import 'package:flutter/material.dart';
import 'package:ontact_family_app/components/DashboardPage.dart';
import 'package:ontact_family_app/components/LoginScreen.dart';
import 'package:ontact_family_app/components/RegisterScreen.dart';

void main() => runApp(MyApp());

// 앱에 로그인 정보가 있으면 바로 대시보드, 없으면 로그인 창 (구현 예정)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginScreen(),
        '/register' : (context) => RegisterScreen(),
        '/pages' : (context) => DashboardPage(),
      },
      title: 'Ontact Family App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
