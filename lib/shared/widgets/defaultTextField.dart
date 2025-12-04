import 'package:flutter/material.dart';
import 'package:sivcam/core/themes/app_colors.dart';

class DefaultTexfield extends StatelessWidget {
  final String text;
  String? initialValue;
  final Function(String text) onChanged;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  final bool isPassword;
  final Color background;
  final Widget? suffixIcon;
  final TextInputType keyboardType; // ✅ Nuevo parámetro

  DefaultTexfield({
    super.key,
    required this.text,
    required this.icon,
    required this.onChanged,
    this.margin = const EdgeInsets.only(top: 20, left: 20, right: 20),
    this.validator,
    this.isPassword = false,
    this.background = AppColors.kfillColors,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType = TextInputType.text, // ✅ Valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: isPassword,
        keyboardType: keyboardType, // ✅ Uso aquí
        style: const TextStyle(fontSize: 14, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: background,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.kgreenPrimaryColors,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.kborderColors,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.kErrorColors,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.kErrorColors,
              width: 2.0,
            ),
          ),
          labelText: text,
          labelStyle: const TextStyle(color: Colors.white70, fontSize: 14),
          errorStyle: const TextStyle(color: AppColors.kErrorColors),
          prefixIcon: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon, color: AppColors.kgreenSecondColors),
                Container(height: 20, width: 1, color: AppColors.kborderColors),
              ],
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
