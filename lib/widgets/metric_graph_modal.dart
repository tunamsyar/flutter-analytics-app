import 'package:flutter/material.dart';
import 'containers/revenue_line_chart_container.dart';
import 'containers/users_bar_chart_container.dart';
import 'containers/conversion_pie_chart_container.dart';

class MetricGraphModal extends StatelessWidget {
  final String title;

  const MetricGraphModal({super.key, required this.title});

  Widget _getChartWidget() {
    switch (title) {
      case 'Revenue':
        return const RevenueLineChartContainer();
      case 'Users':
        return const UsersBarChartContainer();
      case 'Conversion':
        return const ConversionPieChartContainer();
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
