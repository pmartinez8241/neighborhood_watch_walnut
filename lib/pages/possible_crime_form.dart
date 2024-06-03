import 'package:flutter/material.dart';

class CriminalFormSubmission extends StatefulWidget {
  const CriminalFormSubmission({super.key});

  @override
  CriminalFormSubmissionState createState() {
    return CriminalFormSubmissionState();
  }
}

class CriminalFormSubmissionState extends State<CriminalFormSubmission> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepOrange,
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
              ],
            )));
  }
}
