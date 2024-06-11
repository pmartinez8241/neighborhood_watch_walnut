import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neighborhood_watch_walnut/pages/walnut_map.dart';
import 'package:neighborhood_watch_walnut/widgets/map_bottomnavigationbar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: WalnutMap(),
      bottomNavigationBar: MapBottomNavigationBar(),
    );
  }
}
