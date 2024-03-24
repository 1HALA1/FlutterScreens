import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:flutter_interfaces/widgets/Apptextfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.grey[200],
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Log in to your account",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Apptextfield(
                    hintText: " Email address",
                    icon: Icons.email_outlined,
                    borderColor: Color(0xFF2F66F5),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Apptextfield(
                    hintText: "Password",
                    icon: Icons.lock_outline_rounded,
                    borderColor: Color(0xFF2F66F5),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Forgot your password? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/Forgotpassword");
                        },
                        child: Text(
                          "Click here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Appbuttons(
                    text: "Login",
                    routeName: '/Userinterface',
                    backgroundColor: Color(0xFF2F66F5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Don't have an account? "),
                  SizedBox(
                    height: 10,
                  ),
                  Appbuttons(
                    borderColor: Color(0xFF2F66F5),
                    text: "Sign Up",
                    textColor: Color(0xFF2F66F5),
                    routeName: '/Signup',
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
