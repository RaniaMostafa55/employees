import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/employee_model.dart';

class EmployeeServices {
  final endPoint = Uri.parse(
      "https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001");
  List<Employee> employees = [];
  //A function to get employees data
  Future<List<Employee>> getEmployeeData() async {
    var response = await http.get(endPoint);
    List data = jsonDecode(response.body);
    for (var json in data) {
      Employee employee = Employee.fromJson(json);
      employees.add(employee);
    }
    return employees;
  }
}
