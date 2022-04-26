import 'package:flutter/material.dart';

class HeartratePart extends StatefulWidget {
  const HeartratePart({Key? key}) : super(key: key);

  @override
  State<HeartratePart> createState() => _HeartratePartState();
}

class _HeartratePartState extends State<HeartratePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: ((MediaQuery.of(context).size.width - 40) / 2) - 13,
        margin: EdgeInsets.only(right: 5, bottom: 10, left: 5),
        height: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.inner,
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Text(
                '  심장 박동수',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 14,
              left: 0,
              right: 0,
              child: Divider(
                thickness: 2,
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              child: Opacity(
                  opacity: 0.3,
                  child: Icon(
                    Icons.monitor_heart_rounded,
                    size: 75.0,
                    color: Colors.grey,
                  )),
            ),
            Positioned(
                top: 38,
                left: 14,
                child: RichText(
                  text: TextSpan(
                      text: '73',
                      style: TextStyle(
                          fontSize: 33,
                          letterSpacing: 1.0,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'bpm',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.black,
                              fontSize: 12,
                            ))
                      ]),
                )),
            Positioned(
              top: 85,
              left: 5,
              child: Text(
                '안정시 심장박동',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                top: 45,
                left: 82,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '최고 ',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                        children: [
                          TextSpan(
                            text: '123',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: 'bpm',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '최저 ',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontSize: 10,
                        ),
                        children: [
                          TextSpan(
                            text: '123',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.black,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: 'bpm',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
