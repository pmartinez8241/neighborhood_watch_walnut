import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neighborhood_watch_walnut/models/marker_data.dart';

class CriminalFormSubmission extends StatefulWidget {
  final double longituteCoordinate;
  final double latitudeCoordinate;

  CriminalFormSubmission(
      {Key? key,
      required this.longituteCoordinate,
      required this.latitudeCoordinate});

  @override
  State<CriminalFormSubmission> createState() => _CriminalFormSubmissionState();
}

class _CriminalFormSubmissionState extends State<CriminalFormSubmission> {
  final _formKey = GlobalKey<FormState>();
  final crimeLonController = TextEditingController();
  final crimeLatController = TextEditingController();
  final crimeDescriptionController = TextEditingController();

  @override
  void dispose() {
    crimeDescriptionController.dispose();
    crimeLatController.dispose();
    crimeLonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    crimeLonController.text = widget.longituteCoordinate.toString();
    crimeLatController.text = widget.latitudeCoordinate.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: crimeLatController,
                      decoration: const InputDecoration(
                          labelText: "Latitude Coordinate"),

                      /*
                      decoration: const InputDecoration(
                          labelText: "Latitude Coordinate"),
                      readOnly: true,
                      initialValue: widget.latitudeCoordinate.toString(),
                    )*/
                    )),
                SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: crimeLonController,
                      decoration: const InputDecoration(
                          labelText: "Longitude Coordinate"),
                    )),
                SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: crimeDescriptionController,
                      maxLines: 10,
                      decoration: const InputDecoration(
                          labelText: "Description of Event"),
                      // The validator receives the text that the user has entered.
                    )),
                ElevatedButton(
                  onPressed: () {
                    MarkerData submittedMarker = MarkerData(
                        lon: double.parse(crimeLonController.text),
                        lat: double.parse(crimeLatController.text),
                        description: crimeDescriptionController.text);
                    Navigator.pop(context, submittedMarker);
                  },
                  child: const Text("submit"),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
