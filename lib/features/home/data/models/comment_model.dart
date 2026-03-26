import 'package:booking_app/features/auth/data/models/user_model.dart';

class CommentModel {
  final UserModel user;
  final String comment;
  final int starCount;

  CommentModel({required this.user, required this.comment, required this.starCount});

   
}