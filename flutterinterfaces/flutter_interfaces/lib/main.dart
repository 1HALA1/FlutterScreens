import 'package:flutter/material.dart';
import 'package:flutter_interfaces/Congrats.dart';
import 'package:flutter_interfaces/Forgotpassword.dart';
import 'package:flutter_interfaces/LandPage.dart';
import 'package:flutter_interfaces/Login.dart';
import 'package:flutter_interfaces/Managerinterface.dart';
import 'package:flutter_interfaces/Passwordchangedsuccessfully.dart';
import 'package:flutter_interfaces/Randomtext.dart';
import 'package:flutter_interfaces/RegistrationRequestPage%20.dart';
import 'package:flutter_interfaces/Report.dart';
import 'package:flutter_interfaces/Resetpassword.dart';
import 'package:flutter_interfaces/Signup.dart';
import 'package:flutter_interfaces/Speechtotext.dart';
import 'package:flutter_interfaces/Userinterface.dart';
import 'package:flutter_interfaces/VoicePage.dart.dart';
import 'package:flutter_interfaces/voicerec.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/LandPage",
      routes: {
        "/LandPage": (context) => const LandPage(),
        "/Signup": (context) => const Signup(),
        "/Login": (context) => const Login(),
        "/Forgotpassword": (context) => Forgotpassword(),
        '/Resetpassword': (context) => Resetpassword(),
        "/Passwordchangedsuccessfully": (context) =>
            Passwordchangedsuccessfully(),
        "/Randomtext": (context) => Randomtext(),
        "/Userinterface": (context) => Userinterface(),
        "/Managerinterface": (context) => Managerinterface(),
        "/VoicePage": (context) => VoicePage(),
        "/Speechtotext": (context) => Speechtotext(),
        "/Congrats": (context) => Congrats(),
        "/RegistrationRequestsPage": (context) => RegistrationRequestsPage(),
        "/Report" : (context) => Report(),
      },
    );
  }
}
