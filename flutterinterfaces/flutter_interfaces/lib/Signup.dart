import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';
import 'package:flutter_interfaces/widgets/Apptextfield.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isManager = false; // Assume the user is not a manager (initially)

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
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hello!",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 21,
                ),
                Center(
                  child: Apptextfield(
                    hintText: "username",
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Center(
                  child: Apptextfield(
                    hintText: "Enter your email address",
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Apptextfield(
                  hintText: "enter your password",
                  icon: Icons.lock_outline_rounded,
                ),
                SizedBox(
                  height: 23,
                ),
                Apptextfield(
                  hintText: "Confirm your password",
                  icon: Icons.lock_outline_rounded,
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Are you a manager?"),
                    SizedBox(
                      width: 100,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: Switch(
                        key: UniqueKey(),
                        value: isManager,
                        onChanged: (bool newValue) {
                          setState(() {
                            isManager = newValue; 
                          });
                        },
                        activeColor: Color(0xFF2F66F5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Appbuttons(
                  text: "signup",
                  backgroundColor: Color(0xFF2F66F5),
                  onPressed: () {
                    // Check if user is a manager and then navigate
                    if (isManager) {
                      Navigator.pushNamed(context, '/Managerinterface');
                    } else {
                      Navigator.pushNamed(context, '/VoicePage');
                    }
                  },
                ),
                SizedBox(
                  height: 33,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/Login");
                      },
                      child: Text(
                        " Log in",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 27),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
