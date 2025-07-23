class UserBaseData {
  final String id;
  final int userCount;

  UserBaseData({required this.id, required this.userCount});

  factory UserBaseData.fromJson(Map<String, dynamic> json, String docId) {
    return UserBaseData(
      id: docId,
      userCount: (json['user_count'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_count': userCount};
  }
}
