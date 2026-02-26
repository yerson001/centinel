import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/data/models/authResponse.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String dni, String password);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<void> removeUserSession();
  Future<bool> logout();
}
