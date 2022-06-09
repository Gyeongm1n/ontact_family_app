import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CaloriesPart extends StatefulWidget {
  const CaloriesPart({Key? key}) : super(key: key);

  @override
  State<CaloriesPart> createState() => _CaloriesPartState();
}

class _CaloriesPartState extends State<CaloriesPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: ((MediaQuery.of(context).size.width - 40) / 2) - 13,
      margin: EdgeInsets.only(right: 5, bottom: 10, left: 5),
      height: 180,
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
              '오늘 사용 칼로리',
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
          Positioned.fill(
            top: 25,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 140,
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    showFirstLabel: false,
                    showLabels: false,
                    showTicks: false,
                    startAngle: 270,
                    endAngle: 270,
                    minimum: 0,
                    maximum: 2400,
                    axisLineStyle: AxisLineStyle(thickness: 15),
                    pointers: [
                      RangePointer(value: 1700, width: 15,)
                    ],
                  ),
                ]),
              ),
            ),
          ),
          Positioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  '1740/2400kcal',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
