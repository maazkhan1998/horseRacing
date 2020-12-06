import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DrawTab extends StatefulWidget {
  @override
  _DrawTabState createState() => _DrawTabState();
}

class _DrawTabState extends State<DrawTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<_SalesData, String>>[
              HistogramSeries<_SalesData, String>(
                color: Colors.blue[900],
                width: 0.5,
                binInterval: 100,
                  dataSource: <_SalesData>[
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 100),
                    _SalesData('May', 200),
                    _SalesData('May', 200),
                    _SalesData('May', 200),
                    _SalesData('May', 200),
                    _SalesData('May', 300),
                    _SalesData('May', 300),
                    _SalesData('May', 300),
                    _SalesData('May', 300),
                    _SalesData('May', 300),
                    _SalesData('May', 300),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 400),
                    _SalesData('May', 500),
                    _SalesData('May', 500),
                    _SalesData('May', 500),
                    _SalesData('May', 600),
                    _SalesData('May', 700),
                  ],
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  // Enable data label
                  )
            ])
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}