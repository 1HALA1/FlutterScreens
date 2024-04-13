import 'package:flutter/material.dart';
import 'package:flutter_interfaces/widgets/Appbuttons.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
      leading:IconButton( icon:Icon(Icons.arrow_back),
      onPressed:()=> Navigator.pop(context),),
      ),
      body: Column(
       
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Text("Congratulations!", style: TextStyle(
            fontSize: 35
          ),),
          Text("Authentication has been completed succefully", style: TextStyle(
            fontSize: 18,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          Center(
            child:Appbuttons(text: "continue", routeName: '/Login', width: 200, height: 50,)
          ),
        ],
      ),
    );
  }
}