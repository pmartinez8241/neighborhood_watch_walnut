import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CriminalFormSubmission extends StatefulWidget {
  final String markerCoordinates;

  CriminalFormSubmission({Key? key, required this.markerCoordinates});

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
                  decoration: InputDecoration(labelText: "Location"),
                  readOnly: true,
                  initialValue: widget.markerCoordinates,
                ),
                TextFormField(
                  maxLines: 10,
                  decoration:
                      const InputDecoration(labelText: "Description of Event"),
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
