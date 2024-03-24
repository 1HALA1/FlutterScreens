import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';

class Userinterface extends StatefulWidget {
  const Userinterface({Key? key}) : super(key: key);

  @override
  _UserinterfaceState createState() => _UserinterfaceState();
}

class _UserinterfaceState extends State<Userinterface>
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
                        child: Image.asset('assets/mainPhoto.jpg'),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    child: Appbuttons(
                      text: "Request Authentication",
                      routeName: '/VoicePage',
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    child: Appbuttons(
                      text: "Log Out",
                      routeName: '/LandPage',
                    ),
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
