import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sivcam/core/constants/apiConstants.dart';
import 'package:sivcam/features/auth/data/datasource/local/sharefPref.dart';
import 'package:sivcam/features/auth/data/datasource/remote/authService.dart';
import 'package:sivcam/features/auth/data/repositories/authRepositoryImpl.dart';
import 'package:sivcam/features/auth/domain/repositories/authRepository.dart';
import 'package:sivcam/features/auth/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/auth/domain/usecases/getUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/loginUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/logoutUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/saveUsecase.dart';

@module
abstract class AppModule {
  @Injectable()
  SharefPref get sharefPref => SharefPref();
  @Injectable()
  AuthService get authService => AuthService();
  @Injectable()
  AuthRepository get authRepository =>
      AuthRepositoryimpl(authService, sharefPref);
  @Injectable()
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    getSession: GetUseCase(authRepository),
    save: SaveUsecase(authRepository),
    logout: LogoutUseCase(authRepository),
  );
}
