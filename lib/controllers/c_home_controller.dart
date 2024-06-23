import 'package:get/get.dart';
import 'package:student_app_getx/database/database.dart';
import 'package:student_app_getx/model/model.dart';

class HomeController extends GetxController {
  RxBool isSearching = false.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<Student> filterdStudents = <Student>[].obs;

  late DatabaseHelper databaseHelper;

  @override
  void onInit() {
    super.onInit();
    databaseHelper = DatabaseHelper();
    refreshStudentList();
  }

  Future<void> refreshStudentList() async {
    final studentList = await databaseHelper.getStudents();
    students.assignAll(studentList);
    filterdStudents.assignAll(studentList);
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filterdStudents.assignAll(students);
    } else {
      filterdStudents.assignAll(
        students
            .where((student) => student.name
                .trim()
                .toLowerCase()
                .contains(query.trim().toLowerCase()))
            .toList(),
      );
    }
  }

  toggleSearch() {
    isSearching.toggle();
    filterdStudents.assignAll(students);
  }
}
