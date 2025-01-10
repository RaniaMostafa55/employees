import 'package:flutter/material.dart';

//a class contains the design of the buttons used in the app
class CustomButton extends StatelessWidget {
  //the variables required in this class and must send values to them using constructor
  final void Function()? onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    //it returns "ElevatedButton" widget with certain given function to do when pressing the button and certain text to put in the button
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(),
        ));
  }
}
