import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UsersBarChart extends StatelessWidget {
  const UsersBarChart({super.key});

  List<BarChartGroupData> _getBarGroups() {
    return List.generate(4, (i) {
      final values = [80.0, 90.0, 100.0, 110.0];
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(toY: values[i], color: Colors.blue, width: 16),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _getBarGroups(),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) => Text(
                ['Q1', 'Q2', 'Q3', 'Q4'][value.toInt()],
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }
}
