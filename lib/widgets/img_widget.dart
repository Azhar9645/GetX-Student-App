import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_app_getx/model/model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: student.profileimg.isNotEmpty
              ? Image.file(
                  File(student.profileimg),
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.cyan,
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
