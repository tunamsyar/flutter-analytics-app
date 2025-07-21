import 'package:flutter/material.dart';
import 'charts/revenue_line_chart.dart';
import 'charts/users_bar_chart.dart';
import 'charts/conversion_pie_chart.dart';

class MetricGraphModal extends StatelessWidget {
  final String title;

  const MetricGraphModal({super.key, required this.title});

  Widget _getChartWidget() {
    switch (title) {
      case 'Revenue':
        return const RevenueLineChart();
      case 'Users':
        return const UsersBarChart();
      case 'Conversion':
        return const ConversionPieChart();
      default:
        return const SizedBox(child: Text('No chart available'));
    }
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 250, child: _getChartWidget()),
        ],
      ),
    );
  }
}
