import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_currentuser_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/signout_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthNotifier({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthState());

  Future<void> signUp(String email, String password, String role) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await signUpUseCase.execute(email: email, password: password, role: role);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final user = await signInUseCase.execute(email: email, password: password);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> signOut() async {
    await signOutUseCase.execute();
    state = AuthState();
  }

  Future<void> loadCurrentUser() async {
    state = state.copyWith(isLoading: true);
    final user = await getCurrentUserUseCase.execute();
    state = state.copyWith(isLoading: false, user: user);
  }
}
