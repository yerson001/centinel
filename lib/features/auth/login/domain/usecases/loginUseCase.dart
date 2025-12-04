import 'package:sivcam/features/auth/login/data/repositories/authRepositoryImpl.dart';
import 'package:sivcam/features/auth/login/domain/repositories/authRepository.dart';

class LoginUseCase {
  //AuthRepository repository = AuthRepositoryimpl();
  AuthRepository repository;
  LoginUseCase(this.repository);

  run(String dni, String password) => repository.login(dni, password);
}
