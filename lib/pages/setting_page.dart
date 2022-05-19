import 'package:flutter/material.dart';
import 'package:ontact_family_app/services/shared_service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    SharedService.logout(context);
                  },
                  child: Text(
                    "로그아웃"
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  )
                ),
                ElevatedButton(
                    onPressed: () {
                      SharedService.logout(context);
                    },
                    child: Text(
                        "토큰추가"
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
