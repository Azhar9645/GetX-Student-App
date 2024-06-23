import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
Widget TextfieldWidget({
  required String hint,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required Function(String) onChanged,
  required String? Function(String?)? validator,
  required Icon prefixIcon
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: keyboardType,
    onChanged: onChanged,
    controller: controller,
    style: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      hintText: hint,
      hintStyle: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      border:  const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    ),
    validator: validator,
  );
}
