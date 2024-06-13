import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:neighborhood_watch_walnut/provider/map_controller_provider.dart';
import 'package:neighborhood_watch_walnut/provider/marker_provider.dart';

class MarkersListView extends ConsumerWidget {
  const MarkersListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: ListView(
              children: ref
                  .watch(markerNotifierProvider)
                  .map(
                    (x) => GestureDetector(
                      onTap: () {
                        ref
                            .watch(mapControllerProviderProvider)
                            .move(LatLng(x.latitude, x.longitude), 18);
                        Navigator.pop(context);
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(x.latitude.toString()),
                            Text(x.longitude.toString()),
                            Text(x.id),
                            Text(x.description)
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList())),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"))
    ]));
  }
}
