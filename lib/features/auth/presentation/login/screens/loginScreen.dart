import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/data/models/authResponse.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginBloc.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginEvent.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginState.dart';
import 'package:sivcam/features/auth/presentation/login/screens/loginContent.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final response = state.response;
              if (response is ErrorResource) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(response.message)));
              } else if (response is SuccessResource) {
                print("Success Data (Token): ${response.data.token}");
                final authResponse = response.data as AuthResponse;
                context.read<LoginBloc>().add(
                  SaveSession(authResponse: authResponse),
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'client/home',
                  (route) => false,
                );
                /*
                context.read<BlocSocketIO>().add(ConnectSocketIO());
                if (authResponse.user.roles.length > 1) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'roles',
                    (route) => false,
                  );
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'citizen/home',
                    (route) => false,
                  );
                }*/
              }
            },
            //primero se crea el builder luego el listener
            // se le agrega el builder encima para el mensaje de la peticion 401 o [message]
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final response = state.response;
                if (response is LoadingResource) {
                  return Stack(
                    children: [
                      LoginContent(state),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
                return LoginContent(state);
              },
            ),
          ),
          //LoginContent(),

          // Botón de retroceso (izquierda)
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15), // Fondo semitransparente
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // Botón de cerrar (derecha)
          Positioned(
            top: 40,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(
                  0.15,
                ), // Igual que el de la izquierda
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // También puede cerrar o salir
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
