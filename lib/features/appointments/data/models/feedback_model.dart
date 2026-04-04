class FeedbackModel {
  final int id;
  final int stars;
  final String comment;
  final int userId;
  final Map<String, dynamic> user;

  FeedbackModel({
    required this.id,
    required this.stars,
    required this.comment,
    required this.userId,
    required this.user,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    id: json['id'],
    stars: json['stars'],
    comment: json['comment'] ?? '',
    userId: json['user_id'],
    user: json['user'] ?? {},
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'stars': stars,
    'comment': comment,
    'user_id': userId,
    'user': user,
  };
}
