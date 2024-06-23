import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:student_app_getx/controllers/splash_controller.dart';
import 'package:student_app_getx/core/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: color1,
        child: GetBuilder<LoginController>(
          builder: (controller) {
            // Use the controller here
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'STUDENTS DETAILS',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  Lottie.asset(
                    'Assets/Animation - 1719048903205.json',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
