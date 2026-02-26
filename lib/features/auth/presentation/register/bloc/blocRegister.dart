import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/eventRegister.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/stateRegister.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formkey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterIniEvent>((event, emit) {
      emit(state.copyWith(formkey: formkey));
    });
  }
}
