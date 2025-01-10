import 'dart:convert';
import 'package:employees_data/constants.dart';
import 'package:employees_data/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class EmployeeDetails extends StatefulWidget {
  final Employee employee;
  const EmployeeDetails({required this.employee, super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  List<Employee> employees = [];
  //a function to get employees cached data and store it in "employees" list
  getEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? employeesData = prefs.getString("employeesData");
    var cachedData = jsonDecode(employeesData!);
    for (var data in cachedData) {
      employees.add(Employee.fromJson(data));
    }
    setState(() {});
  }

  //get data as soon as the page starts
  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Constants.mainColor,
          title: Text(
            "Employee Details",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                //show employee image
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(image: NetworkImage(widget.employee.imageUrl)),
                ),
              ),
              //show all employee details
              DetailsCard(title: "Id", data: "${widget.employee.id}"),
              DetailsCard(
                  title: "Name",
                  data:
                      "${widget.employee.firstName} ${widget.employee.lastName}"),
              DetailsCard(title: "Age", data: "${widget.employee.age}"),
              DetailsCard(title: "Date of Birth", data: widget.employee.dob),
              DetailsCard(title: "Address", data: widget.employee.address),
              DetailsCard(
                  title: "Contact Number", data: widget.employee.contactNumber),
              DetailsCard(title: "Email", data: widget.employee.email),
              DetailsCard(title: "Salary", data: "${widget.employee.salary}")
            ],
          ),
        ));
  }
}
