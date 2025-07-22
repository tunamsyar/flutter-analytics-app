import 'package:flutter/material.dart';
import '/widgets/charts/revenue_chart.dart';
import '/widgets/charts/users_bar_chart.dart';

class AnalyticsTab extends StatelessWidget {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Analytics'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Performance'),
            ],
          ),
        ),
        body: const TabBarView(children: [UsersBarChart(), RevenueChart()]),
      ),
    );
  }
}
