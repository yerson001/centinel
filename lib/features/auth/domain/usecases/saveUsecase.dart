import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/domain/repositories/authRepository.dart';

class SaveUsecase {
  AuthRepository authRepository;
  SaveUsecase(this.authRepository);

  run(AuthResponse authResponse) async {
    return authRepository.saveUserSession(authResponse);
  }
}
