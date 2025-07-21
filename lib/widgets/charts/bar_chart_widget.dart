import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/chart_data.dart';

class BarChartWidget extends StatelessWidget {
  final List<ChartData> data;

  const BarChartWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: BarChart(
          BarChartData(
            barGroups: data.asMap().entries.map((entry) {
              final i = entry.key;
              final d = entry.value;
              return BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: d.value.toDouble(),
                    color: Colors.blueAccent,
                    width: 20,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    int index = value.toInt();
                    return SideTitleWidget(
                      axisSide: AxisSide.bottom,
                      child: Text(data[index % data.length].label),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
          swapAnimationDuration: const Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
