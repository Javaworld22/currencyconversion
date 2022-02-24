import 'package:currencyconversion/data/api.dart';
import 'package:currencyconversion/data/repository.dart';
import 'package:currencyconversion/ui/rateui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import '../statemodel/currencyscope.dart';
import 'line_titles.dart';

class Graph extends StatelessWidget{

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color (0xff8c9eff),//(0xff02d39a),
  ];


  @override
  Widget build(BuildContext context)  {

    double width = MediaQuery.of(context).size.width;
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(32),
  ),
  color: const Color(0xff2962ff),
  child: Padding(
  padding: const EdgeInsets.only(top: 16),
  child: Container(
    width: width,
  height: 400,
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
                style: TextStyle(fontSize: 12, color: Colors.white70,),),
            ],
          ),
        ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Past 30 days          ',
                    style: TextStyle(fontSize: 12, color: Colors.white38,),),
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
        ),
        SizedBox(height: 15,),
        LabelUI(),
      ],
    ),
  ),
  ),
  );
}


  Widget lineChartWidget() {
    return ScopedModelDescendant<CurrencyScope>(builder: (context, child, model)
    {
      //model.getHistory('EUR');
      return LineChart(
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
             // spots: model.cadList,
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(2.9, 1.3),
                FlSpot(3.8, 1.1),
                FlSpot(4.8, 2),
                FlSpot(5.9, 1.9),
                FlSpot(6.0, 2),
                FlSpot(7.1, 2),
                FlSpot(8.2, 2),
                FlSpot(9.3, 1.5),
                FlSpot(10.9, 5),
                FlSpot(11.8, 2.5),
                FlSpot(12, 4),
                FlSpot(13.5, 3),
                FlSpot(14, 4),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.6))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    });
  }


}


