import 'package:flutter/material.dart';

class DefaultTextfieldOutlined extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final Function(String text) onChanged;
  final String? Function(String?)? validator;
  final bool isPhone;
  final TextInputType keyboardType;

  const DefaultTextfieldOutlined({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.margin = const EdgeInsets.only(top: 10, left: 20, right: 20),
    this.validator,
    this.isPhone = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // le damos altura estable para evitar cambios visuales
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        style: const TextStyle(fontSize: 14, color: Colors.white70),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 12),
          helperText: ' ', // 🔧 reserva espacio para error
          errorStyle: const TextStyle(fontSize: 11, height: 0.8),

          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: const Color(0xFF0ABA61), size: 20),
                const SizedBox(width: 8),
                Container(
                  height: 20,
                  width: 1,
                  color: Color.fromARGB(255, 71, 75, 73),
                ),
              ],
            ),
          ),

          prefix: isPhone
              ? const Padding(
                  padding: EdgeInsets.only(left: 5, right: 2),
                  child: Text(
                    '+51',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : null,

          filled: false,
          fillColor: const Color.fromARGB(255, 30, 30, 30),

          contentPadding: const EdgeInsets.only(left: 0, right: 10, top: 15),

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 54, 56, 55),
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 90, 90, 90), // más oscuro al enfocar
              width: 1,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
          ),
        ),
      ),
    );
  }
}
