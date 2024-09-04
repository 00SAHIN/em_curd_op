import 'package:flutter/material.dart';
import 'employee_registration.dart';

class EmployeeList extends StatefulWidget {
  final String name;
  final String address;
  final String country;
  final String state;
  final List<String> qualification;
  final String religion;

  EmployeeList({
    required this.name,
    required this.address,
    required this.country,
    required this.state,
    required this.qualification,
    required this.religion,
  });

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Map<String, dynamic>> employees = [];

  @override
  void initState() {
    super.initState();
    employees.add({
      'name': widget.name,
      'address': widget.address,
      'country': widget.country,
      'state': widget.state,
      'qualification': widget.qualification,
      'religion': widget.religion,
    });
  }

  void _viewEmployee(Map<String, dynamic> employee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Employee Details'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name: ${employee['name']}'),
                Text('Address: ${employee['address']}'),
                Text('Country: ${employee['country']}'),
                Text('State: ${employee['state']}'),
                Text('Qualification: ${employee['qualification'].join(', ')}'),
                Text('Religion: ${employee['religion']}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editEmployee(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EmployeeRegistration(), // Navigate back to registration form
      ),
    ).then((_) {
      // Handle updated data if needed
    });
  }

  void _deleteEmployee(int index) {
    setState(() {
      employees.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('Country')),
              DataColumn(label: Text('State')),
              DataColumn(label: Text('Qualification')),
              DataColumn(label: Text('Religion')),
              DataColumn(label: Text('Actions')),
            ],
            rows: List<DataRow>.generate(
              employees.length,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(employees[index]['name'])),
                  DataCell(Text(employees[index]['address'])),
                  DataCell(Text(employees[index]['country'])),
                  DataCell(Text(employees[index]['state'])),
                  DataCell(Text(employees[index]['qualification'].join(', '))),
                  DataCell(Text(employees[index]['religion'])),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () => _viewEmployee(employees[index]),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editEmployee(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteEmployee(index),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
