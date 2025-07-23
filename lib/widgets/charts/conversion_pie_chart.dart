import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../models/user_distribution_data.dart';

class ConversionPieChart extends StatelessWidget {
  const ConversionPieChart({super.key, required this.data});

  final List<UserDistributionData> data;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _buildSections(),
        sectionsSpace: 4,
        centerSpaceRadius: 50,
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    final colors = [
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.greenAccent,
      Colors.purpleAccent,
      Colors.redAccent,
      Colors.tealAccent,
    ];

    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return PieChartSectionData(
        value: item.count.toDouble(),
        title: item.label,
        color: colors[index % colors.length],
        titleStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
