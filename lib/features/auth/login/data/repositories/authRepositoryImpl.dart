import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/login/data/datasource/remote/authService.dart';
import 'package:sivcam/features/auth/login/data/models/authResponse.dart';
import 'package:sivcam/features/auth/login/domain/repositories/authRepository.dart';

class AuthRepositoryimpl implements AuthRepository {
  //AuthService authService = AuthService();
  //en lugar de llamar usamos get it injection de dependencias
  AuthService authService;
  AuthRepositoryimpl(this.authService);
  @override
  Future<Resource<AuthResponse>> login(String dni, String password) {
    return authService.login(dni, password);
  }
}
