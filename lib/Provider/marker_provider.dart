import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../models/marker_data.dart';

part 'marker_provider.g.dart';

@riverpod
class MarkerNotifier extends _$MarkerNotifier {
  @override
  List<MarkerData> build() {
    return [];
  }

  void addMarker(
      String markerId, double longitude, double latitude, String description) {
    try {
      state = [
        ...state,
        MarkerData(
            markerId: markerId,
            description: description,
            lat: latitude,
            lon: longitude),
      ];
    } catch (e) {
      print(e);
    }
  }
}
