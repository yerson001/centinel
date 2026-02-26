import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

abstract class LoginEvent {}

//eventos del login

class LoginInit extends LoginEvent {}

class DniChanged extends LoginEvent {
  final BlocFormItem dni;

  DniChanged({required this.dni});
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;

  PasswordChanged({required this.password});
}

class SaveSession extends LoginEvent {
  final AuthResponse authResponse;

  SaveSession({required this.authResponse});
}

class FormSubmitted extends LoginEvent {}
