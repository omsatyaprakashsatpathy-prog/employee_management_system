import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity?> execute({
    required String email,
    required String password,
    required String role,
  }) async {
    if (email.isEmpty || password.isEmpty || role.isEmpty) {
      throw ArgumentError("Email, password, and role are required");
    }
    return await repository.signUp(email, password, role);
  }
}
