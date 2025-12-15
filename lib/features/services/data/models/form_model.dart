import 'package:booking_app/features/services/data/models/service_days_model.dart';
import 'package:booking_app/features/services/data/models/service_hours_model.dart';
import 'package:booking_app/features/services/data/models/service_time_model.dart';
import 'package:image_picker/image_picker.dart';

class FormModel {
  final String category;
  final String name;
  final String description;
  final String city;
  final String location;
  final ServiceTimeModel time;
  final ServiceDaysModel days;
  final ServiceHoursModel hours;
  final String bookPrice;
  final String? fullPrice;
  final XFile? mainImage;
  final List<XFile>? images;

  FormModel({
    required this.category,
    required this.name,
    required this.description,
    required this.city,
    required this.location,
    required this.time,
    required this.days,
    required this.hours,
    required this.bookPrice,
    required this.fullPrice,
    this.mainImage,
    this.images,
  });

  factory FormModel.fromJson(json) {
    return FormModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      location: json['location'],
      time: ServiceTimeModel.fromJson(json['time']),
      days: ServiceDaysModel.fromJson(json['days']),
      hours: ServiceHoursModel.fromJson(json['hours']),
      bookPrice: json['bookPrice'],
      fullPrice: json['fullPrice'],
      mainImage: json['mainImage'] != null ? XFile(json['mainImage']) : null,
      images: json['images'] != null
          ? (json['images'] as List).map((e) => XFile(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'city': city,
      'location': location,
      'time': time.toJson(),
      'days': days.toJson(),
      'hours': hours.toJson(),
      'bookPrice': bookPrice,
      'fullPrice': fullPrice,
      'mainImage': mainImage?.path,
      'images': images?.map((e) => e.path).toList(), 
    };
  }
}
