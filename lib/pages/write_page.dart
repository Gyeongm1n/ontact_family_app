import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _writeUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _writeUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 10,
              top: 30,
            ),
            child: Text(
              "제목",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "title",
            "제목을 입력하세요.",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "제목 입력";
              }

              return null;
            },
                (onSavedVal) {
              title = onSavedVal;
            },
            borderFocusColor: Colors.blue,
            prefixIconColor: Colors.white,
            borderColor: Colors.grey,
            textColor: Colors.black,
            hintColor: Colors.grey.withOpacity(0.8),
            borderRadius: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 10,
              top: 30,
            ),
            child: Text(
              "내용",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black
              ),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "title",
            "내용을 입력하세요.",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "내용 입력";
              }

              return null;
            },
                (onSavedVal) {
              title = onSavedVal;
            },
            borderFocusColor: Colors.blue,
            prefixIconColor: Colors.white,
            borderColor: Colors.grey,
            textColor: Colors.black,
            hintColor: Colors.grey.withOpacity(0.8),
            borderRadius: 0,
            isMultiline: true,
            multilineRows: 15,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "입력",
                  () {
                if (validateAndSave()) {
                  print('입력');
                  setState(() {
                    //isAPIcallProcess = true;
                  });
                }
              },
              btnColor: Colors.grey,
              borderColor: Colors.white,
              txtColor: Colors.black,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}