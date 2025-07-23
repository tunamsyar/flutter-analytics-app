import 'package:flutter/material.dart';
import '../../widgets/containers/user_engagement_chart_container.dart';
import '../../widgets/containers/users_bar_chart_container.dart';

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
              Tab(text: 'User Engagement'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [UsersBarChartContainer(), UserEngagementChartContainer()],
        ),
      ),
    );
  }
}
