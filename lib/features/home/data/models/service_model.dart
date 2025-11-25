import 'package:booking_app/features/home/data/models/comment_model.dart';

class ServiceModel {
  final String name;

  final String title;
  final String description;
  final List<String> images;
  final String location;
  final String category;
  final List<CommentModel> comments;

  ServiceModel({
    required this.name,
    required this.title,
    required this.description,
    required this.images,
    required this.location,
    required this.category,
    required this.comments,
  });

  factory ServiceModel.fromJson(json) => ServiceModel(
    name: json['name'],
    title: json['title'],
    description: json['title'],
    images: json['images'],
    location: json['location'],
    category: json['category'],
    comments: json['comments'],
  );
  
}
