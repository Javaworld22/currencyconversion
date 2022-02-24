
import 'package:flutter/material.dart';


import 'package:fl_chart/fl_chart.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 25,
      getTextStyles: (value) => const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 2:
            return '2 Jan';
          case 5:
            return '5 Jan';
          case 8:
            return '8 Jan';
          case 11:
            return '11 Jan';
          case 14:
            return '14 Jan';
          case 17:
            return '17 Jan';
          case 20:
            return '20 Jan';
          case 23:
            return '23 Jan';
        }
        return '';
      },
      margin: 15,
    ),
    leftTitles: SideTitles(
      showTitles: true,
      getTextStyles: (value) => const TextStyle(
        color: Colors.white38,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '1.09';
          case 3:
            return '3.09';
          case 5:
            return '5.08';
        }
        return '';
      },
      reservedSize: 35,
      margin: 5,
    ),
  );
}