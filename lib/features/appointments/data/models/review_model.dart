
import 'package:booking_app/features/appointments/data/models/feedback_model.dart';

class ReviewModel {
  final double average;
  final int count;
  final List<FeedbackModel> comments;

  ReviewModel({
    required this.average,
    required this.count,
    required this.comments,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewModel(
        average: (json['average'] is int)
            ? (json['average'] as int).toDouble()
            : (json['average'] as num).toDouble(),
        count: json['count'],
        comments: (json['comments'] as List<dynamic>)
            .map((item) => FeedbackModel.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'average': average,
        'count': count,
        'comments': comments.map((e) => e.toJson()).toList(),
      };
}
