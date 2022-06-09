import 'package:flutter/material.dart';
import 'package:ontact_family_app/pages/dashboard_page.dart';
import 'package:ontact_family_app/pages/post_list_page.dart';
import 'package:ontact_family_app/pages/setting_page.dart';
import 'package:ontact_family_app/pages/survey_result_page.dart';

final PageController _pageController = PageController(
  initialPage: 0,
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: '진단',
              icon: Icon(Icons.check_circle_outline)
          ),
          BottomNavigationBarItem(
              label: '노트',
              icon: Icon(Icons.sticky_note_2_outlined)
          ),
          BottomNavigationBarItem(
              label: '설정',
              icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }

  List _widgetOptions = [
    PageView(
      controller: _pageController,
      children: [
        UserDashboard(),
        UserDashboard(),
      ],
    ),
    SurveyResultPage(),
    PostListPage(),
    SettingPage(),
  ];
}
