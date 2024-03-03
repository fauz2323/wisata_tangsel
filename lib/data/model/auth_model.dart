class AuthModel {
  String message;
  User user;

  AuthModel({
    required this.message,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;
  String nama;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.nama,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        nama: json["nama"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama": nama,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
