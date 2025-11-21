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

}
