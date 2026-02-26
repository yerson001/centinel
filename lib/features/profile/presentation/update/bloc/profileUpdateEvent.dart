import 'package:sivcam/features/auth/data/models/user.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;
  ProfileUpdateInitEvent({required this.user});
}

class NameChange extends ProfileUpdateEvent {
  final BlocFormItem name;
  NameChange({required this.name});
}

class LastNameChange extends ProfileUpdateEvent {
  final BlocFormItem lastName;
  LastNameChange({required this.lastName});
}

class PhoneChange extends ProfileUpdateEvent {
  final BlocFormItem phone;
  PhoneChange({required this.phone});
}

class FormSutmit extends ProfileUpdateEvent {}
