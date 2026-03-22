import 'package:booking_app/features/home/data/models/service_model.dart';

class BookingModel {
    int id;
    int userId;
    int serviceId;
    dynamic scheduledAt;
    String status;
    DateTime createdAt;
    DateTime updatedAt;
    ServiceModel service;

    BookingModel({
        required this.id,
        required this.userId,
        required this.serviceId,
        required this.scheduledAt,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.service,
    });

    factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        userId: json["user_id"],
        serviceId: json["service_id"],
        scheduledAt: json["scheduled_at"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        service: ServiceModel.fromJson(json["service"]),
    );


}