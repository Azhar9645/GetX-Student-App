import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_getx/controllers/c_home_controller.dart';
import 'package:student_app_getx/core/colors.dart';
import 'package:student_app_getx/screens/add/add_student.dart';
import 'package:student_app_getx/screens/profile/profile.dart';

// ignore: must_be_immutable
class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color1,
        title: const Text(
          "STUDENTS LIST",
          style: TextStyle(
              fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                controller.filterStudents(value);
              },
              backgroundColor: Colors.cyan.shade100,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          if (controller.filterdStudents.isEmpty) {
            return const Center(
              child: Text(
                'No students found',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.filterdStudents.length,
            itemBuilder: (context, index) {
              final student = controller.filterdStudents[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => Get.to(() => StudentProfile(student: student)),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(237, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Center(
                        child: ListTile(
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundImage: student.profileimg.isNotEmpty
                            ? FileImage(File(student.profileimg))
                            : null,
                        backgroundColor: student.profileimg.isEmpty
                            ? const Color.fromRGBO(135, 192, 205, 1)
                            : null,
                        child: student.profileimg.isEmpty
                            ?  const Icon(Icons.person,
                                size: 40, color: Colors.white)
                            : null,
                      ),
                      title: Text(
                        student.name,
                        style: GoogleFonts.crimsonPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      subtitle: Text(
                        student.school,
                        style: GoogleFonts.crimsonPro(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                      trailing: Text(
                        "Age: ${student.age}",
                        style: GoogleFonts.crimsonPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                      minVerticalPadding:
                          10, // Adjust this value if you want more vertical padding
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 16.0), // Adjust the padding as needed
                    )),
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color1,
        onPressed: () {
          Get.to(Home())!.then((value) => controller.refreshStudentList());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
