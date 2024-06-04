import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerOverlay extends StatefulWidget {
  List<Marker> markerList = [
    Marker(
      point: LatLng(34.04900, -117.850000),
      width: 20,
      height: 20,
      alignment: Alignment.centerLeft,
      child: ColoredBox(
        color: Colors.lightBlue,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text('-->'),
        ),
      ),
    )
  ];

  MapMarkerOverlay({super.key});

  void submitNewMarker(double lat, double lon) {
    markerList.add(Marker(
      point: LatLng(lat, lon),
      width: 20,
      height: 20,
      alignment: Alignment.centerLeft,
      child: const ColoredBox(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text('-->'),
        ),
      ),
    ));
  }

  @override
  State<MapMarkerOverlay> createState() => _MapMarkerOverlayState();
}

class _MapMarkerOverlayState extends State<MapMarkerOverlay> {
  @override
  Widget build(BuildContext context) {
    return MobileLayerTransformer(
        child: MarkerLayer(
      rotate: false,
      markers: widget.markerList,
    ));
  }
}










/*

class MapMarkerOverlay extends StatelessWidget {
  List<Marker> markerList = [];
  MapMarkerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileLayerTransformer(
        child: MarkerLayer(
      rotate: false,
      markers: markerList,
    ) // your child here
        );
  }
}




markers: [
      Marker(
        point: LatLng(34.04900, -117.850000),
        width: 64,
        height: 64,
        alignment: Alignment.centerLeft,
        child: ColoredBox(
          color: Colors.lightBlue,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('-->'),
          ),
        ),
      ),
      Marker(
        point: LatLng(34.051926, -117.880000),
        width: 64,
        height: 64,
        alignment: Alignment.centerRight,
        child: ColoredBox(
          color: Colors.pink,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('<--'),
          ),
        ),
      ),
      Marker(
        point: LatLng(34.010000, -117.820000),
        rotate: false,
        child: ColoredBox(color: Colors.deepPurple),
      ),]
*/