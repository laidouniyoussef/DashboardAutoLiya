import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'line_titles.dart';

class LineCharMonthtWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    Color.fromARGB(255, 240, 189, 162),
    const Color(0xFFFF6600),
  ];

  final List<Color> gradientColorsOpacity = [
    const Color.fromARGB(255, 240, 189, 162).withOpacity(0.3),
    const Color(0xFFFF6600).withOpacity(0.3),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 9,
          minY: 0,
          maxY: 10,
          titlesData: LineTitles.getMonthsTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff68737d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff68737d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff68737d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(1, 1.5 * 3),
                const FlSpot(3, 1 * 3),
                const FlSpot(5, 2.5 * 3),
                const FlSpot(7, 1.5 * 3),
                const FlSpot(9, 3 * 3),
              ],
              isCurved: true,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              barWidth: 5,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColorsOpacity,
                ),
                //.map((color) => color.withOpacity(0.3))
                //            .toList(),
              ),
            ),
          ],
        ),
      );
}
