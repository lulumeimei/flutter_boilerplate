import 'package:assessment/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map[_id],
      name: map[_name],
      email: map[_email],
    );
  }

  factory UserModel.castFromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _id: id,
      _name: name,
      _email: email,
    };
  }

  static const _id = 'id';
  static const _name = 'name';
  static const _email = 'email';
}
