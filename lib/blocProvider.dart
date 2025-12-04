import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/login/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/auth/login/presentation/bloc/loginBloc.dart';
import 'package:sivcam/injection.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>()),
  ),
];
