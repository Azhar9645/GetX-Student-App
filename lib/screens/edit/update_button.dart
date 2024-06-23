import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/controllers/c_home_controller.dart';
import 'package:student_app_getx/controllers/c_student_edit.dart';
import 'package:student_app_getx/database/database.dart';
import 'package:student_app_getx/model/model.dart';
import 'package:student_app_getx/screens/home/student_list.dart';

// ignore: camel_case_types
class Update_button extends StatelessWidget {
  Update_button({
    super.key,
    required this.student,
    required this.databaseHelper,
  });

  final Student student;
  final DatabaseHelper databaseHelper;

  final StudentEditController controller = Get.put(StudentEditController());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.save,
        color: Colors.white,
      ),
      label: const Text(
        'Update',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 15.0,
        ),
        backgroundColor: const Color.fromRGBO(34, 101, 151, 1),
        minimumSize: const Size(250, 50),
      ),
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          final name = controller.nameController.text;
          final school = controller.schoolNameController.text;
          final age = controller.ageController.text;
          final phone = controller.phoneController.text;
          final studentupdate = Student(
            id: student.id,
            name: name,
            school: school,
            age: int.parse(age),
            phone: int.parse(phone),
            profileimg: controller.profileimagpath.isNotEmpty
                ? controller.profileimagpath.value
                : student.profileimg,
          );

          databaseHelper.updateStudent(studentupdate).then((id) {
            if (id > 0) {
              controller.showDialog();
              Get.offAll(() => StudentListScreen());
              Get.find<HomeController>().refreshStudentList();
            } else {
              Get.showSnackbar(
                const GetSnackBar(
                  titleText: Text(
                    'Failed',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  messageText: Text(
                    'Failed to update student',
                    style: TextStyle(fontSize: 12),
                  ),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          });
        }
      },
    );
  }
}
