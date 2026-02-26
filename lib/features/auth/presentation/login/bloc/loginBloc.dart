import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/domain/usecases/authUseCases.dart';
//import 'package:sivcam/features/auth/login/data/datasource/remote/authService.dart';
import 'package:sivcam/features/auth/domain/usecases/loginUseCase.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginEvent.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginState.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';

//AuthService authservice = AuthService(); //solo par aprobar

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  //LoginUseCase loginusecase = LoginUseCase();
  AuthUseCases authUseCases;
  //pasamos los datos con state para inilizar los datos
  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInit>((event, emit) async {
      AuthResponse? authResponse = await authUseCases.getSession.run();
      print('LOCAL SESSION ${authResponse?.toJson()}');
      emit(state.copyWith(formKey: formKey));
      if (authResponse != null) {
        emit(
          state.copyWith(
            response: SuccessResource(authResponse),
            formKey: formKey,
          ),
        );
      }
    });

    on<DniChanged>((event, emit) {
      emit(
        state.copyWith(
          dni: BlocFormItem(
            value: event.dni.value,
            error: event.dni.value.isEmpty
                ? 'Ingrese su DNI'
                : event.dni.value.length < 8
                ? 'DNI tiene 8 dígitos'
                : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isEmpty
                ? 'Ingrese su contraseña'
                : null,
          ),
        ),
      );
    });

    on<SaveSession>((event, emit) async {
      await authUseCases.save.run(event.authResponse);
    });

    on<FormSubmitted>((event, emit) async {
      //emit(state.copyWith(formKey: formKey));
      print(
        'Form submitted DNI: ${state.dni.value} Password: ${state.password.value}',
      );
      emit(state.copyWith(response: LoadingResource(), formKey: formKey));
      Resource response = await authUseCases.login.run(
        state.dni.value,
        state.password.value,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
