import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_solution_challenge/GetStartedPage.dart';
import 'package:google_solution_challenge/signupPage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white),
         switchTheme: SwitchThemeData(trackOutlineColor: WidgetStateProperty.all(Colors.transparent)
         ),
          scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner:false,
      home:  GetStartedPage(),
    );
  }
}

