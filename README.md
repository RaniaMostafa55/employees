# employees_data

A new Flutter project.

## Getting Started

This project is to view employees data through the following steps:
1. Add the "http" package to "pubspec.yaml"
2. Import it in "EmployeeServices" file
3. Detect the endpoint
4. Create an empty list called "employees" to add employees data in
5. Create a function called "getEmployeeData", in this function:
    - Do a "get" request from the specified endpoint
    - Use "jsonDecode" to convert data from string
    - loop in the data to put each value in the form of employee model
    - add the result in the "employees" list and return it from the function
6. In the Home page create function "getEmployee" which calls "getEmployeeData" function when the button is pressed
7. When "fetch data" button is pressed, a "CircularProgressIndicator" will show until the data is ready to show
8. A "ListView.builder" will show to view employees data using ListTiles
9. Each ListTile views a certain employee data