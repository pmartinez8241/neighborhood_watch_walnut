import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WalnutMap extends StatefulWidget {
  static const String route = '/';
  const WalnutMap({super.key});
  @override
  State<WalnutMap> createState() => _WalnutMapPageState();
}

class _WalnutMapPageState extends State<WalnutMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng(34.04208, -117.84642),
          onTap: (TapPosition, point) => {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("THREAT"),
                          content: Text('$point'),
                        ))
              },
          initialZoom: 16,
          cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(const LatLng(34.003931, -117.891541),
                  const LatLng(34.071926, -117.818928)))),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        )
      ],
    );
  }
}
