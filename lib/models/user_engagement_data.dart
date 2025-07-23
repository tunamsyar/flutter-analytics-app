class UserEngagementData {
  final String month;
  final double views;

  UserEngagementData({required this.month, required this.views});
  factory UserEngagementData.fromJson(Map<String, dynamic> json, String docId) {
    return UserEngagementData(
      month: docId,
      views: (json['views'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'views': views};
  }
}
