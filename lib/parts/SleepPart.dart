import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepPart extends StatefulWidget {
  const SleepPart({Key? key}) : super(key: key);

  @override
  State<SleepPart> createState() => _SleepPartState();
}

class _SleepPartState extends State<SleepPart> {
  List<SleepDate> _chartData = [
    SleepDate("D", 80),
    SleepDate("C", 157),
    SleepDate("B", 48),
    SleepDate("A", 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: ((MediaQuery.of(context).size.width - 40) / 2) - 13,
      margin: EdgeInsets.only(right: 5, bottom: 10, left: 5),
      height: 270,
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
            '수면',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.shield_moon_sharp, size: 60, color: Colors.grey,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4시간 45분',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '수면 점수: 71점',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    '취침 04:39',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '기상 10:00',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              series: <ChartSeries>[
                BarSeries<SleepDate, String>(
                  color: Colors.grey,
                  dataSource: _chartData,
                  xValueMapper: (SleepDate gdp, _) => gdp.name,
                  yValueMapper: (SleepDate gdp, _) => gdp.time,
                  width: 0.7,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.outer,
                    builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                      late String str;
                      int num = data!.time;
                      String name = data!.name;
                      String h = (num / 60).toInt().toString();
                      String m = (num % 60).toString();
                      if (num >= 60) {
                        str = "${h}시간 ${m}분 ${name}";
                      }else {
                        str = "${m}분 ${name}" ;
                      }

                      return Text(str);
                    },
                  ),
                ),
              ],
              primaryXAxis: CategoryAxis(
                labelPlacement: LabelPlacement.betweenTicks,
                isVisible: false,
              ),
              primaryYAxis: CategoryAxis(
                maximum: 500,
                isVisible: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SleepDate {
  SleepDate(this.name, this.time);
  final String name;
  final int time;
}
