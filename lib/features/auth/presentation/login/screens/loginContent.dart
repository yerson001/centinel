import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginBloc.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginState.dart';
import 'package:sivcam/features/auth/presentation/login/bloc/loginEvent.dart';
import 'package:sivcam/shared/utils/blocFormItem.dart';
import 'package:sivcam/shared/widgets/defaultTextField.dart';
import 'package:sivcam/shared/widgets/default_onboard_button.dart';

class LoginContent extends StatefulWidget {
  LoginState state;
  LoginContent(this.state, {super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool _obscurePassword = true;
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.state.formKey,
      child: Stack(
        children: [
          // Fondo degradado + overlay oscuro
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 0.7,
                colors: [Color(0xFF075E54), Color(0xFF13161D)],
                //colors: [Color(0xFF0ABA61), Color(0xFF1C1B1E)],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(120, 28, 27, 30),
          ),

          // Contenido principal
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  _logoBanner(),
                  const SizedBox(height: 8),

                  const SizedBox(height: 40),

                  // Correo
                  DefaultTexfield(
                    onChanged: (text) {
                      context.read<LoginBloc>().add(
                        DniChanged(dni: BlocFormItem(value: text)),
                      );
                    },
                    validator: (value) {
                      return widget.state.dni.error;
                    },
                    text: 'Número de DNI',
                    icon: Icons.pin,
                    margin: const EdgeInsets.only(top: 10),
                    keyboardType: TextInputType.number,
                  ),

                  // Contraseña con ícono de ojo
                  DefaultTexfield(
                    onChanged: (text) {
                      context.read<LoginBloc>().add(
                        PasswordChanged(password: BlocFormItem(value: text)),
                      );
                    },
                    validator: (value) {
                      return widget.state.password.error;
                    },
                    text: 'Contraseña',
                    isPassword: _obscurePassword,
                    icon: Icons.lock_outline,
                    margin: const EdgeInsets.only(top: 20),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Checkbox de recordar contraseña
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        activeColor: Color(0xFF1B8D73),
                        //activeColor: Color(0xFF0ABA61),
                      ),
                      const Text(
                        'Recordar contraseña',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),

                  // Botón de login
                  DefauldOnboardButton(
                    text: "Iniciar sesión",
                    color: Color(0xFF1E2329),
                    //color: Color(0xFF0ABA61),
                    margin: EdgeInsets.only(left: 0, right: 0),
                    onPressed: () {
                      final formKey = widget.state.formKey;
                      if (formKey?.currentState?.validate() ?? false) {
                        formKey!.currentState!.save();
                        context.read<LoginBloc>().add(FormSubmitted());
                      }
                    },
                    cBorder: 1,
                    textColor: Colors.white70,
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes cuenta?',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text(
                          'Regístrate',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 110),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '© 2025 sivcam | seguridad | DeepDataVision S.A.C',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          // Abrir política de privacidad o mostrar en modal
                        },
                        child: Text(
                          'Política de Privacidad · Términos de Uso',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF0ABA61),

                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoBanner() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Fila con icono + texto principal estilizado
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.gps_fixed, size: 60, color: Color(0xFF0ABA61)),
              const SizedBox(width: 8),
              // Texto "Patruya" con estilo mixto
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'S',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0ABA61), // Verde institucional
                      ),
                    ),
                    TextSpan(
                      text: 'IVCAM',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontWeight:
                            FontWeight.bold, // si quieres que se vea fuerte
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '      Inicia sesión para continuar',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
