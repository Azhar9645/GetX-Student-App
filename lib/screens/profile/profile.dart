import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_getx/controllers/c_home_controller.dart';
import 'package:student_app_getx/controllers/c_student_profile.dart';
import 'package:student_app_getx/model/model.dart';
import 'package:student_app_getx/widgets/button_widget.dart';
import 'package:student_app_getx/widgets/widgets.dart';

class StudentProfile extends StatelessWidget {
  final Student student;
  StudentProfile({super.key, required this.student});

  final controller = Get.put(StudentProfileController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(17, 63, 103, 1),
        title: const Text(
          'STUDENT PROFILE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 74, 133, 172),
              Color.fromARGB(255, 54, 66, 131)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: student.profileimg.isNotEmpty
                        ? FileImage(File(student.profileimg))
                        : null,
                    backgroundColor:
                        student.profileimg.isEmpty ? Colors.cyan : null,
                    child: student.profileimg.isEmpty
                        ? const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  kheight2,
                  Text(
                    "Name: ${student.name}",
                    style: styledetails(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "School: ${student.school}",
                    style: styledetails(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Age: ${student.age}",
                    style: styledetails(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Phone: ${student.phone}",
                    style: styledetails(),
                  ),
                  kheight2,
                  ButtonWidget(controller: controller, student: student),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle styledetails() => GoogleFonts.montserrat(
        fontSize: 24,
        color: Colors.blueGrey.shade700,
        fontWeight: FontWeight.w500,
      );
}
