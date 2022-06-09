import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeartPage extends StatefulWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  final List<ChartData> chartData = [
    ChartData(1, 60),
    ChartData(2, 67),
    ChartData(3, 73),
    ChartData(4, 61),
    ChartData(5, 103),
    ChartData(6, 70),
    ChartData(7, 82),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            child: SfCartesianChart(
                backgroundColor: Colors.white,
                primaryYAxis: NumericAxis(
                  interval: 10,
                ),
                primaryXAxis: NumericAxis(
                  interval: 1,
                ),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, int>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    markerSettings: MarkerSettings(isVisible: true),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
