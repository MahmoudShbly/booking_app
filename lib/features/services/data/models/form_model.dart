import 'package:booking_app/features/services/data/models/service_days_model.dart';
import 'package:booking_app/features/services/data/models/service_hours_model.dart';
import 'package:booking_app/features/services/data/models/service_time_model.dart';

class FormModel {
  final String category;
  final String name;
  final String description;
  final String city;
  final String location;
  final ServiceTimeModel time;
  final ServiceDaysModel days;
  final ServiceHoursModel hours;
  final double price;

  FormModel({
    required this.category,
    required this.name,
    required this.description,
    required this.city,
    required this.location,
    required this.time,
    required this.days,
    required this.hours,
    required this.price,
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
      price: json['price'],
    );
  }
  Map<String,dynamic> toJson (){
    return {
      'category':category,
      'name':name,
      'description':description,
      'city':city,
      'location':location,
      'time':time.toJson(),
      'days':days.toJson(),
      'hours':hours.toJson(),
      'price':price,

    };
  }
}
