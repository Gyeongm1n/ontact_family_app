import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SurveyResultPage extends StatefulWidget {
  const SurveyResultPage({Key? key}) : super(key: key);

  @override
  State<SurveyResultPage> createState() => _SurveyResultPageState();
}

class _SurveyResultPageState extends State<SurveyResultPage> {
  final List<Item> _data = generateItems(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/survey',
          );
        },
        child: Icon(Icons.add,),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(

          /// ExpansionPanel은 header와 body로 구성되어 있습니다.
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                child: SfCartesianChart(
                    backgroundColor: Colors.white,
                    primaryYAxis: NumericAxis(
                      interval: 1,
                    ),
                    primaryXAxis: NumericAxis(
                      interval: 1,
                    ),
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<ChartData, int>(
                        dataSource: item.expandedValue,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        markerSettings: MarkerSettings(isVisible: true),
                      )
                    ]
                ),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<ChartData> expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  final List<String> _title = ['우울감', '불안감', '고립감', '활동', '식사', '수면'];
  final List<List<int>> _info = [
    [1, 2, 3, 4, 5, 5, 5],
    [2, 2, 2, 3, 3, 2, 5],
    [3, 4, 5, 1, 2, 3, 4],
    [1, 1, 1, 1, 1, 1, 1],
    [2, 3, 2, 3, 4, 1, 2],
    [5, 3, 2, 1, 2, 3, 3]
  ];

  return List<Item>.generate(numberOfItems, (int index) {
    List<ChartData> _chartData = [];

    for (int i = 0; i < _info[index].length; i++) {
      _chartData.add(ChartData(i + 1, _info[index][i]));
    }
    return Item(
      headerValue: _title[index],
      expandedValue: _chartData,
    );
  });
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
}
