class UserModel {
    int id;
    String name;
    String role;
    String email;
    String phone;

    UserModel({
        required this.id,
        required this.name,
        required this.role,
        required this.email,
        required this.phone,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "phone": phone,
    };
}