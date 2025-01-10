import 'package:employees_data/constants.dart';
import 'package:flutter/material.dart';
import '../models/employee_model.dart';
import '../services/employee_services.dart';
import '../widgets/custom_button.dart';
import 'employee_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool isLoading = false;
  //a function to get employees data when needed
  getEmployee() async {
    isLoading = true;
    setState(() {});
    employees = await EmployeeServices().getEmployeeData();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Constants.mainColor,
        title: Text(
          "Home Page",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: "Fetch Data",
                  onPressed: () {
                    getEmployee();
                  },
                )),
            isLoading
                //loading until data is viewed
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //go to employee details page when pressed
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return EmployeeDetails(
                                employee: employees[index],
                              );
                            },
                          ));
                        },
                        //view each employee data
                        child: ListTile(
                          title: Text(employees[index].firstName),
                          leading: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.06,
                            backgroundImage:
                                NetworkImage(employees[index].imageUrl),
                          ),
                          trailing: Text(
                            employees[index].salary.toString(),
                            style: TextStyle(
                                color: Constants.mainColor, fontSize: 20),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
