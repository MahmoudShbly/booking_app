import 'package:booking_app/features/auth/data/models/user_model.dart';

class BookingRequestModel {
  const BookingRequestModel({
    required this.id,
    required this.serviceId,
    required this.status,
    required this.userData,
    this.bookingTime
  });

  final int id;
  final int serviceId;
  final String status;
  final String? bookingTime;
  final UserModel userData;

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) =>
      BookingRequestModel(
        id: json['id'],
        serviceId: json['service_id'],
        status: json['status'],
        bookingTime: json['scheduled_at'],
        userData:UserModel.fromJson(json['user']),
      );


  
}
