import 'package:flutter/material.dart';
import 'package:ontact_family_app/components/UserDashboard.dart';

final PageController _pageController = PageController(
  initialPage: 0,
);

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
