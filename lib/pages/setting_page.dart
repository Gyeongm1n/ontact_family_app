import 'package:flutter/material.dart';
import 'package:ontact_family_app/services/shared_service.dart';

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
            title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
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
                      _displayTextInputDialog(context);
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
