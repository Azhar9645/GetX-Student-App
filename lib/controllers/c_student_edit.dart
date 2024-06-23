import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/model/model.dart';

class StudentEditController extends GetxController {
  RxString profileimagpath = ''.obs;
  RxString name = ''.obs;
  RxString schoolName = ''.obs;
  RxInt age = 0.obs;
  RxInt phone = 0.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final schoolNameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  late String initialName;
  late String initialSchoolName;
  late int initialAge;
  late int initialPhone;

  void initializeData(Student student) {
    initialName = student.name;
    initialAge = student.age;
    initialPhone = student.phone;
    initialSchoolName = student.school;

    nameController.text = initialName;
    schoolNameController.text = initialSchoolName;
    ageController.text = initialAge.toString();
    phoneController.text = initialPhone.toString();
  }

  void updateProfilePicturePath(String path) {
    profileimagpath.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchoolName(String value) {
    schoolName.value = value;
  }

  void updateAge(int value) {
    age.value = value;
  }

  void updatePhone(int value) {
    phone.value = value;
  }

  showDialog() {
    Get.snackbar(
      'Success',
      'Student updated successfully',
      messageText: const Text(
        'Student data updated successfully',
        style: TextStyle(color: Colors.black),
      ),
      titleText: const Text(
        'Success',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      isDismissible: true,
    );
  }
}
