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

class FormSubmitted extends LoginEvent {}
