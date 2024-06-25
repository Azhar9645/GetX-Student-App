import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_app_getx/screens/add/add_student.dart';
import 'package:student_app_getx/screens/home/student_list.dart';
import 'package:student_app_getx/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          titleSmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => StudentListScreen()),
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
      ],
    );
  }
}
