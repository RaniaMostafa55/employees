import 'dart:convert';
import 'package:employees_data/constants.dart';
import 'package:employees_data/widgets/details_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class EmployeeDetails extends StatefulWidget {
  final int index;
  const EmployeeDetails({required this.index, super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  List<Employee> employees = [];
  bool isLoading = false;
  //a function to get employees cached data and store it in "employees" list
  getEmployees() async {
    isLoading = true;
    setState(() {});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? employeesData = prefs.getString("employeesData");
    var cachedData = jsonDecode(employeesData!);
    for (var data in cachedData) {
      employees.add(Employee.fromJson(data));
    }
    isLoading = false;
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      //show employee image
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                            image:
                                NetworkImage(employees[widget.index].imageUrl)),
                      ),
                    ),
                    //show all employee details
                    DetailsCard(
                        title: "Id", data: "${employees[widget.index].id}"),
                    DetailsCard(
                        title: "Name",
                        data:
                            "${employees[widget.index].firstName} ${employees[widget.index].lastName}"),
                    DetailsCard(
                        title: "Age", data: "${employees[widget.index].age}"),
                    DetailsCard(
                        title: "Date of Birth",
                        data: employees[widget.index].dob),
                    DetailsCard(
                        title: "Address",
                        data: employees[widget.index].address),
                    DetailsCard(
                        title: "Contact Number",
                        data: employees[widget.index].contactNumber),
                    DetailsCard(
                        title: "Email", data: employees[widget.index].email),
                    DetailsCard(
                        title: "Salary",
                        data: "${employees[widget.index].salary}")
                  ],
                ),
              ));
  }
}
