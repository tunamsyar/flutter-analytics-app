class UserDistributionData {
  final String id;
  final String label;
  final int count;

  UserDistributionData({
    required this.id,
    required this.label,
    required this.count,
  });

  factory UserDistributionData.fromJson(String id, Map<String, dynamic> json) {
    return UserDistributionData(
      id: id,
      label: json['label'] ?? '',
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'count': count};
  }
}
