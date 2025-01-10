import 'package:employees_data/constants.dart';
import 'package:flutter/material.dart';

//a class contains the design of the details card used in the app
class DetailsCard extends StatelessWidget {
  final String title;
  final String data;
  const DetailsCard({required this.title, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    //it returns a "Text" widget with certain data sent to this class
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text("$title: $data",
          style: TextStyle(
              color: Constants.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
    );
  }
}
