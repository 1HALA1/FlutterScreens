import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Entry {
  final DateTime date;
  final int count;

  Entry(this.date, this.count);
}

List<ChartSeries<Entry, DateTime>> _createDailyData() {
  final dailyData = [
    Entry(DateTime(2024, 1, 4, 8), 100),
    Entry(DateTime(2024, 1, 4, 10), 120),
    Entry(DateTime(2024, 1, 4, 12), 80),
    Entry(DateTime(2024, 1, 4, 14), 150),
    Entry(DateTime(2024, 1, 4, 16), 130),
  ];

  return <ChartSeries<Entry, DateTime>>[
    SplineSeries<Entry, DateTime>(
      dataSource: dailyData,
      xValueMapper: (Entry entry, _) => entry.date,
      yValueMapper: (Entry entry, _) => entry.count,
      color: const Color(0xFF2F66F5),
      markerSettings: MarkerSettings(
        isVisible: true,
        shape: DataMarkerType.circle,
        width: 2,
        height: 4,
      ),
    ),
    SplineAreaSeries<Entry, DateTime>(
      dataSource: dailyData,
      xValueMapper: (Entry entry, _) => entry.date,
      yValueMapper: (Entry entry, _) => entry.count,
      color: Color(0xFFDCE3F5),
    ),
  ];
}

List<ChartSeries<Entry, DateTime>> _createMonthlyData() {
  final monthlyData = [
    Entry(DateTime(2024, 1, 1, 8), 3000),
    Entry(DateTime(2024, 1, 1, 10), 3200),
    Entry(DateTime(2024, 1, 1, 12), 2800),
    Entry(DateTime(2024, 1, 1, 14), 3400),
    Entry(DateTime(2024, 1, 1, 16), 2900),
  ];

  return <ChartSeries<Entry, DateTime>>[
    SplineSeries<Entry, DateTime>(
      dataSource: monthlyData,
      xValueMapper: (Entry entry, _) => entry.date,
      yValueMapper: (Entry entry, _) => entry.count,
      color: Color(0xFF2F66F5),
      markerSettings: MarkerSettings(
        isVisible: true,
        shape: DataMarkerType.circle,
        width: 2,
        height: 4,
      ),
    ),
    SplineAreaSeries<Entry, DateTime>(
      dataSource: monthlyData,
      xValueMapper: (Entry entry, _) => entry.date,
      yValueMapper: (Entry entry, _) => entry.count,
      gradient: LinearGradient(
        colors: [
          Color(0xFFDCE3F5),
          Color(0xFDCE3F5),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  ];
}

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Daily Report",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "People who entered the laboratory",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  isVisible: true,
                  interval: 2,
                  intervalType: DateTimeIntervalType.hours,
                  majorTickLines: MajorTickLines(size: 0),
                  minorTickLines: MinorTickLines(size: 0),
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                  interval: 100,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                ),
                series: _createDailyData(),
                margin: EdgeInsets.all(0),
                borderWidth: 0,
                borderColor: Colors.transparent,
                plotAreaBorderWidth: 0,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Monthly Report",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "People who entered the laboratory",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Center(
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  isVisible: true,
                  interval: 100,
                  majorTickLines: MajorTickLines(size: 0),
                  minorTickLines: MinorTickLines(size: 0),
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false,
                  interval: 1000,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                ),
                series: _createMonthlyData(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
