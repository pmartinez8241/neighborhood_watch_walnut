import 'package:flutter/material.dart';
import 'package:neighborhood_watch_walnut/pages/walnut_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (context) => WalnutMap()},
    );
  }
}
