import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/controllers/c_add_student.dart';
import 'package:student_app_getx/database/database.dart';
import 'package:student_app_getx/model/model.dart';
import 'package:student_app_getx/screens/home/student_list.dart';
import 'package:student_app_getx/widgets/text_field.dart';
import 'package:student_app_getx/widgets/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AddStudentController controller = Get.put(AddStudentController());

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final schoolnameController = TextEditingController();
  final phoneController = TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(17, 63, 103, 1),
        title: const Text(
          'STUDENT FORM',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  kheight2,
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Obx(
                      () => controller.profileimgpath.isNotEmpty
                          ? CircleAvatar(
                              radius: 90,
                              backgroundImage: FileImage(
                                  File(controller.profileimgpath.value)),
                            )
                          : const CircleAvatar(
                              radius: 90,
                              backgroundColor: Color.fromRGBO(135, 192, 205, 1),
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50, // Adjust the icon size as needed
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextfieldWidget(
                    prefixIcon: const Icon(Icons.person),
                    hint: "Name",
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    onChanged: (value) => controller.updateName(value),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  kheight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextfieldWidget(
                          prefixIcon: const Icon(Icons.numbers),
                          hint: "Age",
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) =>
                              controller.updateage(int.parse(value)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an age';
                            } else if (int.tryParse(value) == null ||
                                value.length > 2 ||
                                int.parse(value) == 0) {
                              return 'Please enter a valid age';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextfieldWidget(
                          prefixIcon: const Icon(Icons.school),
                          hint: "School",
                          controller: schoolnameController,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => controller.updateSchool(value),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a school name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  kheight,
                  TextfieldWidget(
                    prefixIcon: const Icon(Icons.phone_android),
                    hint: 'Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        controller.updatePhone(int.parse(value)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (value.length != 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  kheight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StudentListScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 15.0,
                            ),
                            backgroundColor:
                                const Color.fromRGBO(34, 101, 151, 1),
                            minimumSize: const Size(100, 50)),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                          ),
                          backgroundColor:
                              const Color.fromRGBO(34, 101, 151, 1),
                          minimumSize: const Size(250, 50),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final name = controller.name.value;
                            final school = controller.school.value;
                            final age = controller.age.value;
                            final phone = controller.phone.value;
                            final student = Student(
                              id: 0,
                              name: name,
                              school: school,
                              age: age,
                              phone: phone,
                              profileimg: controller.profileimgpath.value,
                            );
                            controller.clearImage();
                            databaseHelper.insertStudent(student).then((id) {
                              if (id > 0) {
                                Get.back();
                                controller.saveStudent();
                              }
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfileImg(image.path);
    }
  }
}
