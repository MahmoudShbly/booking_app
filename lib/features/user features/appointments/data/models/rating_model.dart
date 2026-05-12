class RatingModel {
  final String comment;
  final String stars;

  RatingModel({required this.comment, required this.stars});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      comment: json['comment']  ?? '',
      stars: json['stars'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'comment': comment, 'stars': stars};
  }
}
