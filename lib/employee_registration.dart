import 'package:flutter/material.dart';
import 'employee_list.dart';

class EmployeeRegistration extends StatefulWidget {
  @override
  _EmployeeRegistrationState createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _address = '';
  String _country = '';
  String _state = '';
  List<String> _qualification = [];
  String _religion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensure screen resizes to avoid overflow
      appBar: AppBar(title: Text('Employee Registration')),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView to make it scrollable
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) => _name = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  onChanged: (value) => _address = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Country'),
                  onChanged: (value) => _country = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'State'),
                  onChanged: (value) => _state = value,
                ),
                SizedBox(height: 20),
                Text('Qualification'),
                CheckboxListTile(
                  title: Text('BCA'),
                  value: _qualification.contains('BCA'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        _qualification.add('BCA');
                      } else {
                        _qualification.remove('BCA');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('MCA'),
                  value: _qualification.contains('MCA'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        _qualification.add('MCA');
                      } else {
                        _qualification.remove('MCA');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('B.Tech'),
                  value: _qualification.contains('B.Tech'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        _qualification.add('B.Tech');
                      } else {
                        _qualification.remove('B.Tech');
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                Text('Religion'),
                RadioListTile<String>(
                  title: Text('Hindu'),
                  value: 'Hindu',
                  groupValue: _religion,
                  onChanged: (value) {
                    setState(() {
                      _religion = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Muslim'),
                  value: 'Muslim',
                  groupValue: _religion,
                  onChanged: (value) {
                    setState(() {
                      _religion = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Sikh'),
                  value: 'Sikh',
                  groupValue: _religion,
                  onChanged: (value) {
                    setState(() {
                      _religion = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Christian'),
                  value: 'Christian',
                  groupValue: _religion,
                  onChanged: (value) {
                    setState(() {
                      _religion = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeList(
                            name: _name,
                            address: _address,
                            country: _country,
                            state: _state,
                            qualification: _qualification,
                            religion: _religion,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Add Employee'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
