import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final BlocFormItem phone;
  final BlocFormItem dni;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingrese su nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese su apellido'),
    this.email = const BlocFormItem(error: 'Ingrese su dni'),
    this.password = const BlocFormItem(error: 'Ingrese una contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'Confirme contraseña'),
    this.phone = const BlocFormItem(error: 'Ingrese su teléfono'),
    this.dni = const BlocFormItem(error: 'Ingrese su dni'),
    this.formkey,
    this.response,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    BlocFormItem? phone,
    BlocFormItem? dni,
    GlobalKey<FormState>? formkey,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      dni: dni ?? this.dni,
      formkey: formkey,
    );
  }

  @override
  List<Object?> get props => [name, lastName, email, password];
}
