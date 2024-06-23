import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/controllers/c_student_edit.dart';
import 'package:student_app_getx/database/database.dart';
import 'package:student_app_getx/model/model.dart';
import 'package:student_app_getx/screens/edit/update_button.dart';
import 'package:student_app_getx/widgets/text_field.dart';
import 'package:student_app_getx/widgets/widgets.dart';

class EditStudent extends StatelessWidget {
  final Student student;

  EditStudent({super.key, required this.student});

  final StudentEditController controller = Get.put(StudentEditController());

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    controller.initializeData(student);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(17, 63, 103, 1),
        title: const Text(
          'DETAILS EDIT',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<StudentEditController>(
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      kheight2,
                      GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Obx(
                          () => CircleAvatar(
                            radius: 90,
                            backgroundImage:
                                controller.profileimagpath.isNotEmpty
                                    ? FileImage(
                                        File(controller.profileimagpath.value))
                                    : student.profileimg.isNotEmpty
                                        ? FileImage(File(student.profileimg))
                                        : const NetworkImage(
                                            "https://banner2.cleanpng.com/20180802/gyc/kisspng-computer-icons-shape-user-person-scalable-vector-g-imag-icons-3-617-free-vector-icons-page-4-5b62ba06c36336.0063904315331968068003.jpg",
                                          ) as ImageProvider,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                      kheight,
                      TextfieldWidget(
                        prefixIcon: const Icon(Icons.person),
                        hint: "Name",
                        controller: controller.nameController,
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
                              controller: controller.ageController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  controller.updateAge(int.parse(value)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an age';
                                }
                                if (int.tryParse(value) == null ||
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
                              controller: controller.schoolNameController,
                              keyboardType: TextInputType.text,
                              onChanged: (value) =>
                                  controller.updateSchoolName(value),
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
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) =>
                            controller.updatePhone(int.parse(value)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enuter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      kheight,
                      Update_button(
                          student: student, databaseHelper: databaseHelper)
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfilePicturePath(image.path);
    }
  }
}
