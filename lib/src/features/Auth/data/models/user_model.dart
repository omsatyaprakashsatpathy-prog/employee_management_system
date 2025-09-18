import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.role});

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      email: map['email'],
      role: map['role'],
    );
  }

  Map<String, dynamic> toMap() => {'email': email, 'role': role};
}
