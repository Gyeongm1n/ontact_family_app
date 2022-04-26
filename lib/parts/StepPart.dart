import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' 걸음수',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(
                ' 7312/10000걸음',
                style: TextStyle(fontSize: 10,),
              ),],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SfLinearGauge(
              minimum: 0,
              maximum: 10000,
              axisTrackStyle: LinearAxisTrackStyle(thickness: 15),
              barPointers: [LinearBarPointer(value: 7312, thickness: 15,)],
              showTicks: false,
              showLabels: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '  2.13/4km',
                  style: TextStyle(fontSize: 10,),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SfLinearGauge(
              minimum: 0,
              maximum: 4,
              axisTrackStyle: LinearAxisTrackStyle(thickness: 15),
              barPointers: [LinearBarPointer(value: 2.13, thickness: 15,)],
              showTicks: false,
              showLabels: false,
            ),
          ),
        ],
      )
    );
  }
}


