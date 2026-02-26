import 'package:sivcam/features/auth/domain/repositories/authRepository.dart';

class LogoutUseCase {
  AuthRepository authRepository;

  LogoutUseCase(this.authRepository);
  run() => authRepository.logout();
}
