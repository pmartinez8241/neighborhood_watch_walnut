import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
              initialCenter: LatLng(34.04208, -117.84642),
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
        )
      ]),
    );
  }
}
