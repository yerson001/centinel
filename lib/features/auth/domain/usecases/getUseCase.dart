import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/domain/repositories/authRepository.dart';

class GetUseCase {
  AuthRepository authRepository;
  GetUseCase(this.authRepository);

  Future<AuthResponse?> run() async {
    return authRepository.getUserSession();
  }
}
