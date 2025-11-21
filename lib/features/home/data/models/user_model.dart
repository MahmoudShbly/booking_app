class UserModel {
  final int uid;
  final String name;
  final String email;
  final String phoneNumber;
  final bool isProvider;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.uid,
    this.isProvider = false,
  });
}
