import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteDialoge extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const DeleteDialoge({super.key, required this.onCancel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Delete Student',
        style: GoogleFonts.crimsonPro(
          fontSize: 20,
          color: Colors.white,
          wordSpacing: 4,
          fontWeight: FontWeight.bold,
        ),
      ),
      content:  Text(
        'Are you sure you want to delete this student?',
        style:GoogleFonts.crimsonPro(
          color: Colors.white,
        ),
      ),
        actions: [
        TextButton(
          onPressed: onCancel,
          child:  Text(
            'Cancel',
            style: GoogleFonts.crimsonPro(
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onDelete,
          child:  Text(
            'Delete',
            style: GoogleFonts.crimsonPro(
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
    );
  }
}
