import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neighborhood_watch_walnut/models/marker_data.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

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
    return AlertDialog(
        contentPadding: EdgeInsets.all(5),
        content: SingleChildScrollView(
            scrollDirection: axisDirectionToAxis(AxisDirection.up),
            child: Column(children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: crimeLatController,
                    decoration:
                        const InputDecoration(labelText: "Latitude Coordinate"),

                    /*
                      decoration: const InputDecoration(
                          labelText: "Latitude Coordinate"),
                      readOnly: true,
                      initialValue: widget.latitudeCoordinate.toString(),
                    )*/
                  ),
                  TextFormField(
                    controller: crimeLonController,
                    decoration: const InputDecoration(
                        labelText: "Longitude Coordinate"),
                  ),
                  TextFormField(
                    controller: crimeDescriptionController,
                    maxLines: 8,
                    style: TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        labelText: "Description of Event"),
                    // The validator receives the text that the user has entered.
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var marker_id = _uuid.v4();
                            MarkerData submittedMarker = MarkerData(
                                markerId: marker_id,
                                lon: double.parse(crimeLonController.text),
                                lat: double.parse(crimeLatController.text),
                                description: crimeDescriptionController.text);
                            Navigator.pop(context, submittedMarker);
                          },
                          child: const Text("submit"),
                        ),
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"))
                      ])
                ]),
              )
            ])));
  }
}
