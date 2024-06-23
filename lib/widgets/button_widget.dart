import 'package:flutter/material.dart';
import 'package:student_app_getx/controllers/c_student_profile.dart';
import 'package:student_app_getx/model/model.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.controller,
    required this.student,
  });

  final StudentProfileController controller;
  final Student student;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 320,
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {
                  controller.editStudent(student);
                },
                label: const Text(
                  'EDIT',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              VerticalDivider(
                color: Colors.grey.shade400,
                thickness: 1,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
              TextButton.icon(
                onPressed: () {
                  controller.showCustomDialog(student);
                },
                label: const Text(
                  'DELETE',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
