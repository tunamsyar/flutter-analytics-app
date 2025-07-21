import 'package:flutter/material.dart';
import '../tabs/dashboard_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<Widget> _tabs = [const DashboardTab()];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashboardTab());
  }
}
