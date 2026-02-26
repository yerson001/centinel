import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/domain/usecases/authUseCases.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginBloc.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginEvent.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/blocRegister.dart';
import 'package:sivcam/features/client/presentation/bloc/clientHomeBloc.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoBloc.dart';
import 'package:sivcam/features/profile/presentation/bloc/profileInfoEvent.dart';
import 'package:sivcam/injection.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInit()),
  ),
  BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
  BlocProvider<ClientHomeBloc>(
    create: (context) => ClientHomeBloc(locator<AuthUseCases>()),
  ),
  BlocProvider<ProfileInfoBloc>(
    create: (context) =>
        ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo()),
  ),
];
