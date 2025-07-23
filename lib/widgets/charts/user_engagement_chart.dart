import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/user_engagement_data.dart';

class UserEngagementChart extends StatelessWidget {
  const UserEngagementChart({super.key, required this.data});

  final List<UserEngagementData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8,
                    child: Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return const SizedBox.shrink();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8,
                    child: Text(
                      data[index].month,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.indigo,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.indigo.withOpacity(0.3),
              ),
              spots: data.asMap().entries.map((entry) {
                final index = entry.key.toDouble();
                final views = entry.value.views;
                return FlSpot(index, views);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
