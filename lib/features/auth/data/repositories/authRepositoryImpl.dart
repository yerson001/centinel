import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/data/datasource/local/sharefPref.dart';
import 'package:sivcam/features/auth/data/datasource/remote/authService.dart';
import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/domain/repositories/authRepository.dart';

class AuthRepositoryimpl implements AuthRepository {
  //AuthService authService = AuthService();
  //en lugar de llamar usamos get it injection de dependencias
  AuthService authService;

  SharefPref sharefPref;

  AuthRepositoryimpl(this.authService, this.sharefPref);
  @override
  Future<Resource<AuthResponse>> login(String dni, String password) {
    return authService.login(dni, password);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharefPref.read('sivuser');
    if (data != null) {
      return AuthResponse.fromJson(data);
    }
    return null;
  }

  @override
  Future<void> removeUserSession() async {
    // TODO: implement removeUserSession
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharefPref.save('sivuser', authResponse.toJson());
  }

  @override
  Future<bool> logout() async {
    return await sharefPref.remove('sivuser');
  }
}
