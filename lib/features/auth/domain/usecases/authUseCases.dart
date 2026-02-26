import 'package:sivcam/features/auth/domain/usecases/getUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/loginUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/logoutUseCase.dart';
import 'package:sivcam/features/auth/domain/usecases/saveUsecase.dart';

class AuthUseCases {
  LoginUseCase login;
  GetUseCase getSession;
  SaveUsecase save;
  LogoutUseCase logout;

  AuthUseCases({
    required this.login,
    required this.getSession,
    required this.save,
    required this.logout,
  });
}
