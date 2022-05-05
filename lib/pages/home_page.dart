import 'package:flutter/material.dart';
import 'package:ontact_family_app/pages/dashboard_page.dart';

final PageController _pageController = PageController(
  initialPage: 0,
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          UserDashboard(),
          UserDashboard(),
        ],
      ),
    );
  }
}
