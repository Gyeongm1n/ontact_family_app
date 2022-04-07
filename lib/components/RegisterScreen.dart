import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String userId = '';
  String userPassword = '';
  String userToken = '';
  final _formKey = GlobalKey<FormState>();

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: MediaQuery.of(context).size.height - 170,
              width: MediaQuery.of(context).size.width - 40,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2 - 260),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: ValueKey(1),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return '아이디를 확인하세요.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userId = value!;
                              },
                              onChanged: (value) {
                                userId = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: '아이디를 입력하세요.',
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              key: ValueKey(2),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return '비밀번호를 확인하세요.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userPassword = value!;
                              },
                              onChanged: (value) {
                                userPassword = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: '비밀번호를 입력하세요.',
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              key: ValueKey(3),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 4) {
                                  return '토큰을 확인하세요.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                userToken = value!;
                              },
                              onChanged: (value) {
                                userToken = value;
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.token,
                                  color: Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: '토큰을 입력하세요.',
                                hintStyle:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          _tryValidation();
                        },
                        style: ButtonStyle(),
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '로그인 정보가 있으신가요?',
                          style: TextStyle(fontSize: 15, letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text('로그인'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
