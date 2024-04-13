import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';

class Managerinterface extends StatefulWidget {
  const Managerinterface({Key? key}) : super(key: key);

  @override
  _ManagerinterfaceState createState() => _ManagerinterfaceState();
}

class _ManagerinterfaceState extends State<Managerinterface>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 0, end: 400)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

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
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        width: _animation.value,
                        height: _animation.value,
                        child: Image.asset('assets/secondPhoto.jpg'),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Appbuttons(
                      text: "Registration Requests",
                      routeName: '/RegistrationRequestsPage'),
                  SizedBox(height: 20),
                  Appbuttons(text: "Random Texts", routeName: '/Randomtext'),
                  SizedBox(height: 20),
                  Appbuttons(text: "Reports", routeName: '/Report'),
                  SizedBox(height: 20),
                  Appbuttons(text: "Log Out", routeName: '/LandPage'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
