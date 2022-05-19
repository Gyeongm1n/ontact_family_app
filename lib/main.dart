import 'package:flutter/material.dart';
import 'package:ontact_family_app/pages/heart_page.dart';
import 'package:ontact_family_app/pages/home_page.dart';
import 'package:ontact_family_app/pages/login_page.dart';
import 'package:ontact_family_app/pages/register_page.dart';
import 'package:ontact_family_app/services/shared_service.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomePage();
  }

  runApp(const MyApp());
}

// 앱에 로그인 정보가 있으면 바로 대시보드, 없으면 로그인 창 (구현 예정)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => _defaultHome,
        '/home' : (context) => const HomePage(),
        '/login' : (context) => const LoginPage(),
        '/register' : (context) => const RegisterPage(),
        '/heart': (context) => const HeartPage(),
      },
      title: 'Ontact Family App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
