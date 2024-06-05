import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:neighborhood_watch_walnut/map_layers/mark_layer.dart';
import 'package:neighborhood_watch_walnut/models/marker_data.dart';
import 'package:neighborhood_watch_walnut/pages/possible_crime_form.dart';

class WalnutMap extends StatefulWidget {
  const WalnutMap({super.key});
  @override
  State<WalnutMap> createState() => _WalnutMapPageState();
}

class _WalnutMapPageState extends State<WalnutMap> {
  MapMarkerOverlay markerLayer = MapMarkerOverlay();
  List<Marker> cityCrimeMarkers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
          interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.pinchZoom |
                  InteractiveFlag.drag |
                  InteractiveFlag.scrollWheelZoom),
          initialCenter: const LatLng(34.04208, -117.84642),
          onMapEvent: (x) => {setState(() {})},
          onTap: (TapPosition, point) {
            _getResultsAsync(context, point.longitude, point.latitude);
          },
          initialZoom: 16,
          cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(const LatLng(34.003931, -117.891541),
                  const LatLng(34.071926, -117.818928)))),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: cityCrimeMarkers,
          rotate: false,
        )
      ],
    );
  }

  Future _getResultsAsync(BuildContext context, double lon, double lat) async {
    MarkerData result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CriminalFormSubmission(
                  latitudeCoordinate: lat,
                  longituteCoordinate: lon,
                )));
    cityCrimeMarkers.add(Marker(
      point: LatLng(result.latitude, result.longitude),
      width: 20,
      height: 20,
      alignment: Alignment.center,
      child: const ColoredBox(
        color: Colors.lightBlue,
        child: Align(
          alignment: Alignment.center,
          child: Text('~'),
        ),
      ),
    ));
    print(result.toString());
    setState(() {});
  }
}
