import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../widgets/metric_card.dart';
import '../../../widgets/metric_graph_modal.dart';
import '../../widgets/charts/sine_wave_chart.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  late double revenue;
  late int users;
  late double conversion;
  late double bounceRate;

  late double revenueChange;
  late double userChange;
  late double conversionChange;
  late double bounceChange;

  final random = Random();

  @override
  void initState() {
    super.initState();
    _generateRandomMetrics();
  }

  void _generateRandomMetrics() {
    revenue = 100000 + random.nextInt(50000).toDouble();
    users = 40000 + random.nextInt(10000);
    conversion = 2 + random.nextDouble() * 2;
    bounceRate = 20 + random.nextDouble() * 10;

    revenueChange = _randomChange();
    userChange = _randomChange();
    conversionChange = _randomChange();
    bounceChange = _randomChange();
  }

  double _randomChange() {
    return (random.nextDouble() * 10 - 5); // -5% to +5%
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.refresh),
            onPressed: () {
              setState(() {
                _generateRandomMetrics();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Key Metrics',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: MetricCard(
                    title: 'Revenue',
                    value: '\$${revenue.toStringAsFixed(0)}',
                    change:
                        '${revenueChange >= 0 ? '+' : ''}${revenueChange.toStringAsFixed(1)}%',
                    icon: MdiIcons.currencyUsd,
                    isPositive: revenueChange >= 0,
                    onPressed: () => _showMetricGraph(context, 'Revenue'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MetricCard(
                    title: 'Users',
                    value: users.toString(),
                    change:
                        '${userChange >= 0 ? '+' : ''}${userChange.toStringAsFixed(1)}%',
                    icon: MdiIcons.accountMultiple,
                    isPositive: userChange >= 0,
                    onPressed: () => _showMetricGraph(context, 'Users'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: MetricCard(
                    title: 'Conversion',
                    value: '${conversion.toStringAsFixed(2)}%',
                    change:
                        '${conversionChange >= 0 ? '+' : ''}${conversionChange.toStringAsFixed(1)}%',
                    icon: MdiIcons.trendingUp,
                    isPositive: conversionChange >= 0,
                    onPressed: () => _showMetricGraph(context, 'Conversion'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MetricCard(
                    title: 'Bounce Rate',
                    value: '${bounceRate.toStringAsFixed(1)}%',
                    change:
                        '${bounceChange >= 0 ? '+' : ''}${bounceChange.toStringAsFixed(1)}%',
                    icon: MdiIcons.exitToApp,
                    isPositive: bounceChange >= 0,
                    onPressed: () => _showMetricGraph(context, 'Bounce Rate'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'For Funsies',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const LineChartSample10(),
          ],
        ),
      ),
    );
  }

  void _showMetricGraph(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => MetricGraphModal(title: title),
    );
  }
}
