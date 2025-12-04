import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

//variables que cambiasn de estado
class LoginState extends Equatable {
  final BlocFormItem dni;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const LoginState({
    this.dni = const BlocFormItem(error: 'Igrese su DNI'),
    this.password = const BlocFormItem(error: 'Ingrese su contraseña'),
    this.formKey,
    this.response,
  });

  //funcion para copiar el estado
  //pero opcional
  LoginState copyWith({
    BlocFormItem? dni,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    //validad nulo sino existe el valor del contructor
    return LoginState(
      dni: dni ?? this.dni,
      password: password ?? this.password,
      formKey: formKey ?? this.formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [formKey, dni, password, response];
}
