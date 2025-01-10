import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class EmployeeServices {
  final endPoint =
      ("https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001");
  List<Employee> employees = [];
  //A function to get employees data
  Future<List<Employee>> getEmployeeData() async {
    final dio = Dio();
    try {
      var response = await dio.get(endPoint);
      var data = response.data;
      for (var json in data) {
        Employee employee = Employee.fromJson(json);
        employees.add(employee);
      }
      var employeesData = jsonEncode(data);
      //use "SharedPreferences" to cache employees data
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("employeesData", employeesData);
    } catch (e) {
      print(e);
    }
    return employees;
  }
}
