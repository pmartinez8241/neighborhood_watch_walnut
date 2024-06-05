class MarkerData {
  double? longitude;
  double? latitude;
  String? description;

  MarkerData({required double lon, required double lat, required description}) {
    longitude = lon;
    latitude = lat;
    this.description = description;
  }
  @override
  String toString() {
    // TODO: implement toString
    return "longitude = $longitude \n Latitude = $latitude \n Description = $description";
  }
}
