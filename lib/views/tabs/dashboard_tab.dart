import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../widgets/metric_card.dart';
import '../../widgets/charts/revenue_chart.dart';
import '../../../widgets/metric_graph_modal.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(MdiIcons.refresh),
            onPressed: () {
              // Refresh data logic
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
                    value: '\$125,430',
                    change: '+12.5%',
                    icon: MdiIcons.currencyUsd,
                    isPositive: true,
                    onPressed: () => _showMetricGraph(context, 'Revenue'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MetricCard(
                    title: 'Users',
                    value: '48,291',
                    change: '+8.2%',
                    icon: MdiIcons.accountMultiple,
                    isPositive: true,
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
                    value: '3.24%',
                    change: '-0.3%',
                    icon: MdiIcons.trendingUp,
                    isPositive: false,
                    onPressed: () => _showMetricGraph(context, 'Conversion'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MetricCard(
                    title: 'Bounce Rate',
                    value: '24.8%',
                    change: '-2.1%',
                    icon: MdiIcons.exitToApp,
                    isPositive: true,
                    onPressed: () => _showMetricGraph(context, 'Bounce Rate'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Revenue Trend',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const RevenueChart(),
          ],
        ),
      ),
    );
  }
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
