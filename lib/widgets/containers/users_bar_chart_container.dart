import 'package:flutter/material.dart';
import 'package:flutter_firebase_analytics/di/injection.dart';
import '../../services/firestore_service.dart';
import '../../models/user_base_data.dart';
import '../charts/users_bar_chart.dart';

class UsersBarChartContainer extends StatelessWidget {
  const UsersBarChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = getIt<FirestoreService>();

    return FutureBuilder<List<UserBaseData>>(
      future: firestoreService.getUserBaseData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading user data'));
        }
        final data = snapshot.data ?? [];
        return UsersBarChart(data: data);
      },
    );
  }
}
