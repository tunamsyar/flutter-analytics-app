import 'package:flutter/material.dart';
import 'package:flutter_firebase_analytics/di/injection.dart';
import '../../services/firestore_service.dart';
import '../../models/user_engagement_data.dart';
import '../charts/user_engagement_chart.dart';

class UserEngagementChartContainer extends StatelessWidget {
  const UserEngagementChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = getIt<FirestoreService>();

    return FutureBuilder<List<UserEngagementData>>(
      future: firestoreService.getUserEngagementData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading user engagement data'),
          );
        }
        final data = snapshot.data ?? [];
        return UserEngagementChart(data: data);
      },
    );
  }
}
