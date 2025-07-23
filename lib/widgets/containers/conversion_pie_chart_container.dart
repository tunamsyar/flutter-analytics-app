import 'package:flutter/material.dart';
import 'package:flutter_firebase_analytics/di/injection.dart';
import '../../services/firestore_service.dart';
import '../../models/user_distribution_data.dart';
import '../charts/conversion_pie_chart.dart';

class ConversionPieChartContainer extends StatelessWidget {
  const ConversionPieChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = getIt<FirestoreService>();

    return FutureBuilder<List<UserDistributionData>>(
      future: firestoreService.getUserDistributionData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading user distribution data'),
          );
        }
        final data = snapshot.data ?? [];
        return ConversionPieChart(data: data);
      },
    );
  }
}
