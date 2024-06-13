import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapControllerProvider extends _$MapControllerProvider {
  @override
  MapController build() {
    return new MapController();
  }
}
