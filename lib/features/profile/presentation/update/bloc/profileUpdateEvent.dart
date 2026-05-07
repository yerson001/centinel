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

class NameChanged extends ProfileUpdateEvent {
  final BlocFormItem name;
  NameChanged({required this.name});
}

class LastNameChanged extends ProfileUpdateEvent {
  final BlocFormItem lastname;
  LastNameChanged({required this.lastname});
}

class PhoneChanged extends ProfileUpdateEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}

class PickImage extends ProfileUpdateEvent {}

class TakePhoto extends ProfileUpdateEvent {}

class FormSubmit extends ProfileUpdateEvent {}

class FormSutmit extends ProfileUpdateEvent {}
