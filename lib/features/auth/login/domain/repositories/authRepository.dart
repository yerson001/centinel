import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/login/data/models/authResponse.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String dni, String password);
}
