import 'package:flutter/material.dart';
import 'package:sivcam/features/onboard/screens/onboardContent.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardContent(),
          Positioned(
            top: 50, // Distancia desde la parte superior
            left: 270, // Distancia desde la parte izquierda
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black.withOpacity(
                0,
              ), // Fondo semi-transparente para el texto
              child: Text(
                'V0.0001',
                style: TextStyle(
                  color: Color.fromARGB(178, 255, 255, 255), // Color blanco
                  fontSize: 15, // Tamaño de la fuente
                  fontWeight: FontWeight.normal, // Negrita
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
