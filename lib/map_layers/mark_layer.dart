import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapMarkerOverlay extends StatelessWidget {
  const MapMarkerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileLayerTransformer(
        child: MarkerLayer( rotate: false, markers: [

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
        child: ColoredBox(color: Colors.black),
      ),
    ]) // your child here
        );
  }
}
