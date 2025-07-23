class MonthlyRevenueData {
  final String month;
  final double revenue;

  MonthlyRevenueData({required this.month, required this.revenue});

  factory MonthlyRevenueData.fromJson(Map<String, dynamic> json, String docId) {
    return MonthlyRevenueData(
      month: docId,
      revenue: (json['revenue'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'revenue': revenue};
  }
}
