import 'package:intl/intl.dart';

class MarkerData {
  double longitude = 0.0;
  double latitude = 0.0;
  String description = "";
  String id = "";
  DateTime currentDateTime = DateTime.now();

  MarkerData(
      {String? id,
      required double lon,
      required double lat,
      required description}) {
    longitude = lon;
    latitude = lat;
    this.description = description;
  }

  String getTime() {
    final currentTime = DateFormat("HH:mm:ss");
    final formmattedTime = currentTime.format(currentDateTime);
    return formmattedTime;
  }

  String getDate() {
    final currentDate = DateFormat("yyyy-MM-dd");
    final formmattedDate = currentDate.format(currentDateTime);
    return formmattedDate;
  }

  @override
  String toString() {
    final time = getTime();
    final date = getDate();
    // TODO: implement toString
    return "longitude = $longitude\n Latitude = $latitude\n Description = $description\n SubmitTime = $time \nSubmit Date = $date\n ID = $id";
  }
}
