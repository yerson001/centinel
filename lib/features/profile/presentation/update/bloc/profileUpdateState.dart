import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

class ProfileUpdateState {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;
  ProfileUpdateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese su telefono'),
    this.formKey,
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [name, lastName, phone, formKey];
}
