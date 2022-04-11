import 'package:flutter/material.dart';
import 'package:ontact_family_app/Charts/MyPainter.dart';

class StepPart extends StatefulWidget {
  const StepPart({Key? key}) : super(key: key);

  @override
  State<StepPart> createState() => _StepPartState();
}

class _StepPartState extends State<StepPart> {
  List<double> points = [200, 80];
  // 가로축에 적을 텍스트(레이블)
  List<String> labels = [
    "2018",
    "2019",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: ((MediaQuery.of(context).size.width - 40) / 2) - 10,
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
              '  걸음',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Divider(
              thickness: 2,
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            child: CustomPaint(
              size: Size(150, 50),
              painter: MyPainter(),
            ),
          ),
        ],
      ),
    );
  }
}


