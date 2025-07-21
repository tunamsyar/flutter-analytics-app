import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueLineChart extends StatelessWidget {
  const RevenueLineChart({super.key});

  List<FlSpot> _getDataPoints() {
    return [FlSpot(0, 100), FlSpot(1, 110), FlSpot(2, 120), FlSpot(3, 125)];
  }

  String _getYAxisLabel(double value) => '\$${value.toInt()}';
  String _getXAxisLabel(double value) =>
      ['Q1', 'Q2', 'Q3', 'Q4'][value.toInt()];

  @override
  Widget build(BuildContext context) {
    final data = _getDataPoints();

    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: data,
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
