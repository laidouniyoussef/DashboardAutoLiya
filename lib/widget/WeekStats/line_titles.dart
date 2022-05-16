import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static String getDays(value) {
    switch (value.toInt()) {
      case 2:
        return 'LUN';
      case 4:
        return 'MAR';
      case 6:
        return 'MER';
      case 8:
        return 'JEU';
      case 10:
        return 'VEN';
      case 12:
        return 'SAM';
      case 14:
        return 'DIM';
    }
    return '';
  }

  static String getWeekStats(value) {
    switch (value.toInt()) {
      case 1 * 3:
        return '10';
      case 2 * 3:
        return '30';
      case 3 * 3:
        return '50';
    }
    return '';
  }

  static getWeekTitleData() => FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, titleMeta) {
            return const Padding(
              // You can use any widget here
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                ' ',
                style: TextStyle(
                  color: Color(0xff68737d),
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 35,
          getTitlesWidget: (value, titleMeta) {
            return const Padding(
              // You can use any widget here
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                ' ',
                style: TextStyle(
                  color: Color(0xff68737d),
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTitlesWidget: (value, titleMeta) {
            return Padding(
              // You can use any widget here
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Transform.rotate(
                angle: 0,
                child: Text(
                  getDays(value),
                  style: const TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          interval: 1,
          getTitlesWidget: (value, titleMeta) {
            return Padding(
              // You can use any widget here
              padding: const EdgeInsets.only(top: 12.0, left: 12),
              child: Text(
                getWeekStats(value),
                style: const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            );
          },
        ),
      ));
}
