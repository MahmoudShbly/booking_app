import 'package:booking_app/features/home/data/models/comment_model.dart';

class ServiceModel {
  final String name;
  final String bookPrice;
  final String fullPrice;
  final String description;
  final String mainImage;
  final List<dynamic> images;
  final String city;
  final String location;
  final String category;
  final List<CommentModel> comments;


  ServiceModel({
    required this.name,
    required this.bookPrice,
    required this.fullPrice,
    required this.description,
    required this.images,
    required this.city,
    required this.location,
    required this.category,
    required this.comments, required this.mainImage,
  });

  factory ServiceModel.fromJson(json) => ServiceModel(
    name: json['name']??'',
    bookPrice: json['book_price']??'',
    fullPrice: json ['fullPrice']??'',
    description: json['description']??'',
    images: json['otherImages']??[],
    city: json['city']??'',
    location: json['location']??'',
    category: json['category']??'',
    comments: json['comments']??[], mainImage: '${json['mainImage']??''}',
  );
  
}
