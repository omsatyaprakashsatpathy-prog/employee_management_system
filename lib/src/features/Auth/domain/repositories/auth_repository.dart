import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signUp(String email, String password, String role);
  Future<UserEntity?> signIn(String email, String password);
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
}
