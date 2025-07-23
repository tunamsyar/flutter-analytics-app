import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../models/monthly_revenue_data.dart';

class RevenueLineChart extends StatelessWidget {
  final List<MonthlyRevenueData> data;

  const RevenueLineChart({super.key, required this.data});

  List<FlSpot> _getDataPoints() {
    final sortedData = List<MonthlyRevenueData>.from(data)
      ..sort((a, b) => a.month.compareTo(b.month));

    return sortedData.asMap().entries.map((entry) {
      final index = entry.key.toDouble();
      final revenue = entry.value.revenue;
      return FlSpot(index, revenue);
    }).toList();
  }

  String _getYAxisLabel(double value) => '\$${value.toInt()}';
  String _getXAxisLabel(double index) {
    final int i = index.toInt();
    if (i < 0 || i >= data.length) return '';

    final dateString = data[i].month;
    try {
      final parts = dateString.split('-');
      if (parts.length != 2) return '';
      final year = parts[0].substring(2);
      final month = parts[1].padLeft(2, '0');
      return '$month/$year';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final points = _getDataPoints();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: points,
            isCurved: true,
            color: Theme.of(context).colorScheme.primary,
            barWidth: 3,
            dotData: FlDotData(show: true),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (value, _) => Text(
                _getYAxisLabel(value),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, _) => Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _getXAxisLabel(value),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.black26),
        ),
      ),
    );
  }
}
