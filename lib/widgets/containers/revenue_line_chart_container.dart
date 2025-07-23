import 'package:flutter/material.dart';
import 'package:flutter_firebase_analytics/di/injection.dart';
import '../../services/firestore_service.dart';
import '../../models/monthly_revenue_data.dart';
import '../charts/revenue_line_chart.dart';

class RevenueLineChartContainer extends StatelessWidget {
  const RevenueLineChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = getIt<FirestoreService>();

    return FutureBuilder<List<MonthlyRevenueData>>(
      future: firestoreService.getMonthlyRevenue(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading revenue data'));
        }
        final data = snapshot.data ?? [];
        return RevenueLineChart(data: data);
      },
    );
  }
}
