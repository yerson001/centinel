import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/blocProvider.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginBloc.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginEvent.dart';
import 'package:sivcam/features/auth/presentation/login/screens/loginScreen.dart';
import 'package:sivcam/features/auth/presentation/register/screens/registerScreen.dart';
import 'package:sivcam/features/client/presentation/screens/clientHomeScreen.dart';
import 'package:sivcam/features/onboard/screens/onboardScreen.dart';
import 'package:sivcam/features/profile/presentation/update/profileUpdateScreen.dart';
import 'package:sivcam/injection.dart';

void main() async {
  // inicializar bloc
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //envolver materialapp con blocprovider para uno solo
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        title: 'SIVCAM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'onboard',
        routes: {
          'onboard': (context) => const OnboardScreen(),
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegisterScreen(),
          'client/home': (context) => const ClientHomeScreen(),
          'profile/update': (context) => const ProfileUpdateScreen(),
        },
      ),
    );
  }
}
