import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/marker_data.dart';

const _uuid = Uuid();

class MarkerNotifier extends Notifier<List<MarkerData>> {
  @override
  List<MarkerData> build() => [
        MarkerData(lon: -117.84, lat: 34.04, description: "THREAT"),
        MarkerData(lon: -117.86, lat: 34.06, description: "THREAT")
      ];

  static final markerNotifierProvier =
      NotifierProvider<MarkerNotifier, List<MarkerData>>(
          () => MarkerNotifier());

  void add(double longitude, double latitude, String description) {
    state = [
      ...state,
      MarkerData(
          id: _uuid.v4(),
          description: description,
          lat: latitude,
          lon: longitude),
    ];
  }
}
