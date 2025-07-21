import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MetricGraphModal extends StatelessWidget {
  final String title;

  const MetricGraphModal({super.key, required this.title});

  List<FlSpot> _getDataPoints() {
    switch (title) {
      case 'Revenue':
        return [FlSpot(0, 100), FlSpot(1, 110), FlSpot(2, 120), FlSpot(3, 125)];
      case 'Users':
        return [FlSpot(0, 80), FlSpot(1, 90), FlSpot(2, 100), FlSpot(3, 110)];
      case 'Conversion':
        return [
          FlSpot(0, 3.5),
          FlSpot(1, 3.4),
          FlSpot(2, 3.3),
          FlSpot(3, 3.24),
        ];
      case 'Bounce Rate':
        return [FlSpot(0, 26), FlSpot(1, 25), FlSpot(2, 24), FlSpot(3, 24.8)];
      default:
        return [];
    }
  }

  String _getXAxisLabel(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Q1';
      case 1:
        return 'Q2';
      case 2:
        return 'Q3';
      case 3:
        return 'Q4';
      default:
        return '';
    }
  }

  String _getYAxisLabel(double value) {
    if (title == 'Conversion') {
      return '${value.toStringAsFixed(1)}%';
    } else if (title == 'Revenue') {
      return '\$${value.toInt()}';
    } else {
      return value.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _getDataPoints();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title Trend',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: LineChart(
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
                      getTitlesWidget: (value, meta) => Text(
                        _getYAxisLabel(value),
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          _getXAxisLabel(value),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.black26),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
