import 'package:sivcam/features/auth/login/data/models/role.dart';

class User {
  int id;
  String name;
  String lastname;
  String email;
  String phone;
  String dni;
  dynamic image;
  dynamic notificationToken;
  bool isActive;
  DateTime updatedAt;
  DateTime createdAt;
  List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.dni,
    required this.image,
    required this.notificationToken,
    required this.isActive,
    required this.updatedAt,
    required this.createdAt,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    dni: json["dni"],
    image: json["image"],
    notificationToken: json["notification_token"],
    isActive: json["is_active"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "dni": dni,
    "image": image,
    "notification_token": notificationToken,
    "is_active": isActive,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
