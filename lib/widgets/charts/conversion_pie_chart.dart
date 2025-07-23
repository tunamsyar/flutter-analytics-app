import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../models/user_distribution_data.dart';

class ConversionPieChart extends StatefulWidget {
  const ConversionPieChart({super.key, required this.data});

  final List<UserDistributionData> data;

  @override
  State<ConversionPieChart> createState() => _ConversionPieChartState();
}

class _ConversionPieChartState extends State<ConversionPieChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _buildSections(),
        sectionsSpace: 4,
        centerSpaceRadius: 50,
        pieTouchData: PieTouchData(
          touchCallback: (event, response) {
            if (event.isInterestedForInteractions &&
                response != null &&
                response.touchedSection != null) {
              setState(() {
                touchedIndex = response.touchedSection!.touchedSectionIndex;
              });
            } else {
              setState(() {
                touchedIndex = null;
              });
            }
          },
        ),
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

    return widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final isTouched = index == touchedIndex;

      final sectionTitle = isTouched
          ? '${item.label} (${item.count})'
          : item.label;

      return PieChartSectionData(
        value: item.count.toDouble(),
        title: sectionTitle,
        color: colors[index % colors.length],
        titleStyle: TextStyle(
          fontSize: isTouched ? 16 : 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        radius: isTouched ? 72 : 60,
        titlePositionPercentageOffset: 0.6,
      );
    }).toList();
  }
}
