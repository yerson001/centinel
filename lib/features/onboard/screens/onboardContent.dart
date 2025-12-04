import 'package:flutter/material.dart';
import 'package:sivcam/shared/widgets/default_onboard_button.dart';

class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo con imagen
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/onboard_bg.jpg',
              ), // Ruta de tu imagen
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(
              0.6,
            ), // Puedes ajustar la opacidad aquí
          ),
        ),
        // Gradiente radial sobre el fondo (dejando el centro libre)
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center, // Gradiente centrado
              radius:
                  1.5, // Define el radio del gradiente (ajústalo para que cubra los bordes)
              colors: const [
                Colors.transparent, // Centro sin degradado (transparente)
                //Color(0xFF2B2B2B), // Color del borde con el gradiente
                Color(0xFF13161D),
                //Color(0xFF1C1B1E),
              ],
              stops: const [
                0.0,
                1.0,
              ], // Define dónde empieza y termina el gradiente
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(120, 28, 27, 30),
        ),
        // Contenido principal (botones y demás)
        Positioned(
          bottom: 100, // Ajusta la distancia desde el fondo
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alinea todo el contenido a la izquierda
              children: [
                // El banner de la imagen
                //_imageBanner(),
                _logoBanner(),

                // Espacio adicional
                SizedBox(height: 120),

                // Botón de "Iniciar Sesión"
                DefauldOnboardButton(
                  text: "INICIAR SESIÓN",
                  color: Colors.white70,
                  textColor: Colors.black,

                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  cBorder: 0,
                ),

                SizedBox(height: 10),

                // Botón de "Crear Cuenta"
                DefauldOnboardButton(
                  text: "CREAR UNA CUENTA",
                  //color: Colors.transparent,
                  color: Color(0xFF1E2329),
                  textColor: Colors.white70,
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  cBorder: 1,
                ),

                SizedBox(height: 20),

                // Separador
                _separator(context),

                SizedBox(height: 20),

                // Botón de "Invitado"
                DefauldOnboardButton(
                  text: "¿ESTOY SEGURO?",
                  //color: const Color.fromARGB(255, 24, 22, 22),
                  color: const Color(0xFFA93226),

                  textColor: Colors.white70,
                  onPressed: () {},
                  cBorder: 0,
                ),
              ],
            ),
          ),
        ),
      ],
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
                      text: 'SIV',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0ABA61), // Verde institucional
                      ),
                    ),
                    TextSpan(
                      text: 'CAM',
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
            '     Seguridad y Confianza',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[300],
            ),
          ),

          const SizedBox(height: 100),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Acción inmediata, protección total. La plataforma que conecta a tu equipo de seguridad.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 168, 160, 160),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _separator(context) {
    return Row(
      children: const [
        Expanded(child: Divider(thickness: 1, color: Colors.white70)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('O', style: TextStyle(color: Colors.white70)),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.white70)),
      ],
    );
  }
}
