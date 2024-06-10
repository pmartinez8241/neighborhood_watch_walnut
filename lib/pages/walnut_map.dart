import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:neighborhood_watch_walnut/Provider/mark_provider.dart';
import 'package:neighborhood_watch_walnut/models/marker_data.dart';
import 'package:neighborhood_watch_walnut/pages/possible_crime_form.dart';

class WalnutMap extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterMap(
      options: MapOptions(
          interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.pinchZoom |
                  InteractiveFlag.drag |
                  InteractiveFlag.scrollWheelZoom),
          initialCenter: const LatLng(34.04208, -117.84642),
          onMapEvent: (x) => {},
          onTap: (TapPosition, point) {
            _getResultsAsync(context, ref, point.longitude, point.latitude);
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
          markers: ref
              .watch(MarkerNotifier.markerNotifierProvier)
              .map((e) => Marker(
                  point: LatLng(e.latitude, e.longitude),
                  child: const ColoredBox(color: Colors.black)))
              .toList(),
          rotate: false,
        )
      ],
    );
  }

  Future _getResultsAsync(
      BuildContext context, WidgetRef ref, double lon, double lat) async {
    MarkerData result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CriminalFormSubmission(
                  latitudeCoordinate: lat,
                  longituteCoordinate: lon,
                )));
    ref
        .watch(MarkerNotifier.markerNotifierProvier.notifier)
        .add(result.longitude, result.latitude, result.description);
    print(result.toString());
  }
}
