import 'package:flutter/material.dart';
import 'package:ontact_family_app/services/shared_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('fitbit토큰을 입력하세요'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "fitbit토큰 입력"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    if (codeDialog == null) return;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
  String? codeDialog;
  String? valueText;


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
                      _displayTextInputDialog(context);
                    },
                    child: Text(
                      "토큰 추가",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      primary: Colors.blue,
                    )
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.naver.com/'));
                    },
                    child: Text(
                        "토근 발급 도움말",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      primary: Colors.blue,
                    )
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      SharedService.logout(context);
                    },
                    child: Text(
                      "로그아웃",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      primary: Colors.blue,
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
