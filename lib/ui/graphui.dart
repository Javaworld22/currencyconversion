import 'package:currencyconversion/data/api.dart';
import 'package:currencyconversion/data/repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'line_titles.dart';

class Graph extends StatelessWidget{

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];


  @override
  Widget build(BuildContext context)  {
    double width = MediaQuery.of(context).size.width;
    ApiRepository().getGBP(API.EUR);
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(32),
  ),
  color: const Color(0xff020227),
  child: Padding(
  padding: const EdgeInsets.only(top: 16),
  child: Container(
    width: width,
  height: 300,
    child: Column(
      children: <Widget>[
        Row(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: '        Past 30 days',
                style: TextStyle(fontSize: 12, color: Colors.green,),),
            ],
          ),
        ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Past 30 days          ',
                    style: TextStyle(fontSize: 12, color: Colors.green,),),
                ],
              ),
            ),
    ],
        ),
        SizedBox(height: 25,),
        Container(
          width: width,
          height: 260,
        child: lineChartWidget(),
        )
      ],
    ),
  ),
  ),
  );
}


  Widget lineChartWidget() => LineChart(
  LineChartData(
  minX: 0,
  maxX: 11,
  minY: 0,
  maxY: 6,
    titlesData: LineTitles.getTitleData(),
  gridData: FlGridData(
    show: true,
    getDrawingHorizontalLine: (value) {
    return FlLine(
    color: const Color(0xff37434d),
    strokeWidth: 1,
    );
  },
    drawVerticalLine: false,
    getDrawingVerticalLine: (value) {
      return FlLine(
      color: const Color(0xff37434d),
      strokeWidth: 1,
    );
  },
  ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d), width: 1),
    ),
      lineBarsData: [
      LineChartBarData(
      spots: [
      FlSpot(0, 3),
    FlSpot(2.6, 2),
        FlSpot(2.6, 2),
        FlSpot(2.7, 2),
        FlSpot(2.8, 2),
        FlSpot(2.9, 2),
        FlSpot(3.0, 2),
        FlSpot(3.1, 2),
        FlSpot(3.2, 2),
        FlSpot(3.3, 2),
    FlSpot(4.9, 5),
    FlSpot(6.8, 2.5),
    FlSpot(8, 4),
    FlSpot(9.5, 3),
    FlSpot(11, 4),
    ],
  isCurved: true,
  colors: gradientColors,
  barWidth: 2,
   dotData: FlDotData(show: true),
  belowBarData: BarAreaData(
  show: true,
      colors: gradientColors
      .map((color) => color.withOpacity(0.5))
      .toList(),
          ),
        ),
      ],
   ),
  );


}


