import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeartPage extends StatefulWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  State<HeartPage> createState() => _HeartPageState();
}

class _HeartPageState extends State<HeartPage> {
  final List<ChartData> chartData = [
    ChartData(1, 35),
    ChartData(2, 28),
    ChartData(3, 34),
    ChartData(4, 32),
    ChartData(5, 40),
    ChartData(6, 35),
    ChartData(7, 28),
    ChartData(8, 34),
    ChartData(9, 32),
    ChartData(11, 40),
    ChartData(12, 35),
    ChartData(13, 28),
    ChartData(14, 34),
    ChartData(15, 32),
    ChartData(16, 40),
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
                series: <ChartSeries>[
                  // Renders line chart
                  FastLineSeries<ChartData, int>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,

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
