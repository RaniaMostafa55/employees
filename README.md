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
10. Note that some lines were added in the "main.dart" file to ignore the SSL certificate validation process when connecting to a server to solve handshaking error

--------------------------------------------------------------------------------------------------------

In this task, I did the same in different way with some extra features by the following steps:
1. Add the "dio" and "shared_preferences" packages to "pubspec.yaml"
2. Import them in "EmployeeServices" file
3. Detect the endpoint and add empty list of "employees"
4. Create a function called "getEmployeeData", in this function:
    - Create an object from "dio"
    - Do a "get" request from the specified endpoint
    - Loop in the response data to put each value in the form of employee model
    - Add the result in the "employees" list and return it from the function
    - Use "SharedPreferences" to cache employees data
    - Use try & catch to prevent the app from crashing if a problem is found and handle errors
5. A new page created to view each employee details
6. In this page, a function was created to get the cached data as soon as the page starts
7. In the body of the page: an image of the employee is shown , then use "DetailsCard" widget multiple times to show all employee details
8. This widget takes only the required title and data to view them