import 'package:flutter/material.dart';

class DisplayDataScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String cellPhone;

  const DisplayDataScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.cellPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: "First Name",
              ),
              initialValue: firstName,
              enabled: false,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Last Name",
              ),
              initialValue: lastName,
              enabled: false,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              initialValue: email,
              enabled: false,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Cell Phone",
              ),
              initialValue: cellPhone,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
