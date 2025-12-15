import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.phone,
    required super.website,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      website: json['website'] ?? "",
      address: Address(
        street: json['address']['street'] ?? "",
        city: json['address']['city'] ?? "",
        zipcode: json['address']['zipcode'] ?? "",
      ),
    );
  }
}
