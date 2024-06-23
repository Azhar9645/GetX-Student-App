

import 'package:get/get.dart';
import 'package:student_app_getx/screens/home/student_list.dart';

class LoginController extends GetxController{
  @override
  void onInit() {
  
    super.onInit();
    gotoLogin();
  }
   Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offAll( StudentListScreen());
  }
}