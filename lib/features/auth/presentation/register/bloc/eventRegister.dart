import 'package:sivcam/shared/utils/blocFormItem.dart';

abstract class RegisterEvent {}

class RegisterIniEvent extends RegisterEvent {}

class NameChangedRegister extends RegisterEvent {
  final BlocFormItem name;
  NameChangedRegister({required this.name});
}

class LastNameChangedRegister extends RegisterEvent {
  final BlocFormItem lastName;
  LastNameChangedRegister({required this.lastName});
}

class EmailChangedRegister extends RegisterEvent {
  final BlocFormItem email;
  EmailChangedRegister({required this.email});
}

class PasswordChangedRegister extends RegisterEvent {
  final BlocFormItem password;
  PasswordChangedRegister({required this.password});
}

class ConfirmPasswordChangedRegister extends RegisterEvent {
  final BlocFormItem confirmPassword;
  ConfirmPasswordChangedRegister({required this.confirmPassword});
}

class PhoneChangedRegister extends RegisterEvent {
  final BlocFormItem phone;
  PhoneChangedRegister({required this.phone});
}

class DniChangedRegister extends RegisterEvent {
  final BlocFormItem dni;
  DniChangedRegister({required this.dni});
}

class SaveUserSassion extends RegisterEvent {}

class FormSubmit extends RegisterEvent {}

class FormReset extends RegisterEvent {}
