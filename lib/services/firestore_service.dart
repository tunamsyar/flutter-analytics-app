import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../models/monthly_revenue_data.dart';
import '../models/user_base_data.dart';
import '../models/user_distribution_data.dart';
import '../models/user_engagement_data.dart';

abstract class FirestoreService {
  Future<List<MonthlyRevenueData>> getMonthlyRevenue();
  Future<List<UserBaseData>> getUserBaseData();
  Future<List<UserDistributionData>> getUserDistributionData();
  Future<List<UserEngagementData>> getUserEngagementData();
}

@Injectable(as: FirestoreService)
class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore _firestore;
  FirestoreServiceImpl(this._firestore);

  @override
  Future<List<MonthlyRevenueData>> getMonthlyRevenue() async {
    final snapshot = await _firestore.collection('monthly_revenue').get();

    final revenueList = snapshot.docs.map((doc) {
      final data = doc.data();
      final month = doc.id;

      return MonthlyRevenueData(
        month: month,
        revenue: (data['revenue'] ?? 0.0).toDouble(),
      );
    }).toList();

    revenueList.sort((a, b) => a.month.compareTo(b.month));

    return revenueList;
  }

  @override
  Future<List<UserBaseData>> getUserBaseData() async {
    final snapshot = await _firestore.collection('user_base').get();
    final userBaseList = snapshot.docs.map((doc) {
      final data = doc.data();
      final id = doc.id;

      return UserBaseData(id: id, userCount: (data['user_count'] ?? 0).toInt());
    }).toList();

    return userBaseList;
  }

  @override
  Future<List<UserDistributionData>> getUserDistributionData() async {
    final snapshot = await _firestore.collection('user_distribution').get();
    final userDistributionList = snapshot.docs.map((doc) {
      final data = doc.data();
      final id = doc.id;

      return UserDistributionData.fromJson(id, data);
    }).toList();

    return userDistributionList;
  }

  @override
  Future<List<UserEngagementData>> getUserEngagementData() async {
    final snapshot = await _firestore.collection('user_engagement').get();

    final engagementList = snapshot.docs.map((doc) {
      final data = doc.data();
      final id = doc.id;

      return UserEngagementData.fromJson(data, id);
    }).toList();

    return engagementList;
  }
}
