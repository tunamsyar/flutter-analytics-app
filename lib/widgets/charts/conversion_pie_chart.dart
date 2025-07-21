import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ConversionPieChart extends StatelessWidget {
  const ConversionPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 3.5, title: 'Q1'),
          PieChartSectionData(value: 3.4, title: 'Q2'),
          PieChartSectionData(value: 3.3, title: 'Q3'),
          PieChartSectionData(value: 3.24, title: 'Q4'),
        ],
        sectionsSpace: 2,
        centerSpaceRadius: 30,
      ),
    );
  }
}
