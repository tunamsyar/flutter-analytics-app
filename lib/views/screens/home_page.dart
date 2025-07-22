import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../tabs/analytics_tab.dart';
import '../tabs/dashboard_tab.dart';
import '../tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const DashboardTab(),
    const AnalyticsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(MdiIcons.viewDashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(MdiIcons.chartLine),
            label: 'Analytics',
          ),
          NavigationDestination(icon: Icon(MdiIcons.account), label: 'Profile'),
        ],
      ),
    );
  }
}
