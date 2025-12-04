import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sivcam/core/constants/api_constants.dart';
import 'package:sivcam/features/auth/login/data/datasource/remote/authService.dart';
import 'package:sivcam/features/auth/login/data/repositories/authRepositoryImpl.dart';
import 'package:sivcam/features/auth/login/domain/repositories/authRepository.dart';
import 'package:sivcam/features/auth/login/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/auth/login/domain/usecases/loginUseCase.dart';

@module
abstract class AppModule {
  @Injectable()
  AuthService get authService => AuthService();
  @Injectable()
  AuthRepository get authRepository => AuthRepositoryimpl(authService);
  @Injectable()
  AuthUseCases get authUseCases =>
      AuthUseCases(login: LoginUseCase(authRepository));
}
