import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/blocRegister.dart';
import 'package:sivcam/features/auth/presentation/register/bloc/stateRegister.dart';
import 'package:sivcam/shared/widgets/default_Textfield_Outlined.dart';
import 'package:sivcam/shared/widgets/default_onboard_button.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;

  RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formkey,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 0.6,
            colors: [Color(0xFF075E54), Color(0xFF13161D)],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 🔒 Logo fijo arriba
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: _logoBanner(),
              ),

              // 📜 Formulario desplazable
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      DefaultTextfieldOutlined(
                        hintText: 'Nombres',
                        icon: Icons.person_outline,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        onChanged: (text) {
                          /*context.read<RegisterBloc>().add(
                            NameChangedTextFiend(
                              name: BlocFormItem(value: text),
                            ),
                          );*/
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaultTextfieldOutlined(
                        hintText: 'Apellidos',
                        icon: Icons.person_4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        onChanged: (text) {
                          /*context.read<RegisterBloc>().add(
                            LastNameChangedTextFiend(
                              lastName: BlocFormItem(value: text),
                            ),
                          );*/
                        },
                        validator: (value) {
                          return state.lastName.error;
                        },
                      ),

                      DefaultTextfieldOutlined(
                        hintText: 'DNI',
                        icon: Icons.pin,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        onChanged: (text) {
                          /*
                          context.read<RegisterBloc>().add(
                            DniChangedTextFiend(dni: BlocFormItem(value: text)),
                          );*/
                        },
                        validator: (value) {
                          return state.dni.error;
                        },
                      ),
                      DefaultTextfieldOutlined(
                        hintText: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        isPhone: false,
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          /*
                          context.read<RegisterBloc>().add(
                            PhoneChangedTextFiend(
                              phone: BlocFormItem(value: text),
                            ),
                          );*/
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),

                      DefaultTextfieldOutlined(
                        hintText: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        onChanged: (text) {
                          /*
                          context.read<RegisterBloc>().add(
                            PasswordChangedTextFiend(
                              password: BlocFormItem(value: text),
                            ),
                          );*/
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaultTextfieldOutlined(
                        hintText: 'Confirma Contraseña',
                        icon: Icons.lock_outline,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 1,
                        ),
                        onChanged: (text) {
                          /*
                          context.read<RegisterBloc>().add(
                            ConfirmPasswordChangedTextFiend(
                              confirmPassword: BlocFormItem(value: text),
                            ),
                          );*/
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),

                      DefauldOnboardButton(
                        text: "Crear usuario",
                        color: Color(0xFF1E2329),
                        cBorder: 1,
                        onPressed: () {
                          print("Valores actuales:");
                          print(
                            "Nombre: ${state.name.value}, Error: ${state.name.error}",
                          );
                          print(
                            "Apellido: ${state.lastName.value}, Error: ${state.lastName.error}",
                          );
                          print(
                            "Email: ${state.dni.value}, Error: ${state.dni.error}",
                          );
                          print(
                            "Telefono: ${state.phone.value}, Error: ${state.phone.error}",
                          );
                          print(
                            "Password: ${state.password.value}, Error: ${state.password.error}",
                          );
                          print(
                            "Confirm Password: ${state.confirmPassword.value}, Error: ${state.confirmPassword.error}",
                          );

                          if (state.formkey!.currentState!.validate()) {
                            //context.read<RegisterBloc>().add(FormSubmit());
                            //context.read<RegisterBloc>().add(FormReset());
                          } else {
                            print("Formulario no válido");
                          }
                        },
                        textColor: Colors.white70,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Ya tienes una cuenta?',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Inicia sesión',
                              style: TextStyle(fontSize: 14),
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
        ),
      ),
    );
  }
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
                    text: 'P',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0ABA61), // Verde institucional
                    ),
                  ),
                  TextSpan(
                    text: 'ATRUYA',
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

        Text(
          '      Seguridad y Confianza',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    ),
  );
}
