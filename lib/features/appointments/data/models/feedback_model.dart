class FeedbackModel {
  final int id;
  final int stars;
  final String comment;
  final int userId;
  final String userName;

  FeedbackModel({
    required this.id,
    required this.stars,
    required this.comment,
    required this.userId,
    required this.userName,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    id: json['id'],
    stars: json['stars'],
    comment: json['comment'] ?? '',
    userId: json['user_id'],
    userName: json['user_name'] ,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'stars': stars,
    'comment': comment,
    'user_id': userId,
    'user_name': userName,
  };
}
