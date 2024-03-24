import 'package:flutter/material.dart';

class Apptextfield extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Color iconColor;
  final double width;
  final double height;
  final Color? borderColor;
  final TextEditingController? controller;
  final VoidCallback? onIconPressed; 
  const Apptextfield({
    Key? key,
    required this.hintText,
    this.icon,
    this.iconColor = const Color(0xFF2F66F5),
    this.width = 400.0,
    this.height = 50.5,
    this.borderColor,
    this.controller,
    this.onIconPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 0.70)
              : null,
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
            prefixIcon: icon != null
                ? IconButton(
                    
                    icon: Icon(icon),
                    color: iconColor,
                    onPressed: onIconPressed, 
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(12.0),
          ),
        ),
      ),
    );
  }
}
