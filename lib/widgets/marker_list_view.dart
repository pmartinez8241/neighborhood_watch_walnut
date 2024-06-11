import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neighborhood_watch_walnut/provider/marker_provider.dart';

class MarkersListView extends ConsumerWidget {
  const MarkersListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Stack(children: [
      (ListView(
          children: ref
              .watch(markerNotifierProvider)
              .map((x) => Card(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(x.latitude.toString()),
                      Text(x.longitude.toString()),
                      Text(x.id),
                      Text(x.description)
                    ],
                  )))
              .toList())),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"))
    ]));
  }
}
