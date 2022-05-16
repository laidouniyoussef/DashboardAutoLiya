import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static String getWeek(value) {
    switch (value.toInt()) {
      case 1:
        return '1';
      case 3:
        return '8';
      case 5:
        return '16';
      case 7:
        return '24';
      case 9:
        return '30';
    }
    return '';
  }

  static String getMonthStats(value) {
    switch (value.toInt()) {
      case 1 * 3:
        return '100';
      case 2 * 3:
        return '150';
      case 3 * 3:
        return '300';
    }
    return '';
  }

  static getMonthsTitleData() => FlTitlesData(
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
                  getWeek(value),
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
              padding: const EdgeInsets.only(top: 12.0, left: 10),
              child: Text(
                getMonthStats(value),
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
