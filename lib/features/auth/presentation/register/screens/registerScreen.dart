import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sivcam/core/errors/resource.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/blocRegister.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/stateRegister.dart';
import 'package:sivcam/features/auth/presentation/register/screens/registerContent.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              final response = state.response;
              if (response is ErrorResource) {
                Fluttertoast.showToast(
                  msg: response.message,
                  toastLength: Toast.LENGTH_LONG,
                );
              } else if (response is SuccessResource) {
                /*
                final authResponse = response.data as AuthResponseModel;
                context.read<RegisterBloc>().add(
                  SaveUserSession(authResponse: authResponse),
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'citizen/home',
                  (route) => false,
                );*/
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return RegisterContent(state);
              },
            ),
          ),
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
