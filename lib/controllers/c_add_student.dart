import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddStudentController extends GetxController {
  RxString profileimgpath = ''.obs;
  RxString name = ''.obs;
  RxString school = ''.obs;
  RxInt age = 0.obs;
  RxInt phone = 0.obs;

  void updateProfileImg(String path) {
    profileimgpath.value = path;
  }

  void updateName(String value) {
    name.value = value;
  }

  void updateSchool(String value) {
    school.value = value;
  }

  void updateage(int value) {
    age.value = value;
  }

  void updatePhone(int value) {
    phone.value = value;
  }

  void clearImage() {
    profileimgpath.value = '';
  }

  @override
  void onClose() {
    clearImage();
    super.onClose();
  }

  saveStudent() {
    Get.snackbar(
      'Success',
      'Student added successfully',
      messageText: const Text(
        'Student added successfully',
        style: TextStyle(color: Colors.black),
      ),
      titleText: const Text(
        'Success',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 17),
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
