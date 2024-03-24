import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';

class Forgotpassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<Forgotpassword> {
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 35),
              ),
              Text(
                "Please enter your Email to receive your password and reset information",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              TextField(
                decoration: InputDecoration(hintText: "name@example.com"),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Appbuttons(
                text: "Reset",
                routeName: '/Resetpassword',
              ))
            ],
          ),
        ),
      ),
    );
  }
}
