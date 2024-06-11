import 'package:flutter/material.dart';
import 'package:neighborhood_watch_walnut/pages/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neighborhood_watch_walnut/widgets/map_bottomnavigationbar.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/markerlist": (context) => MapBottomNavigationBar(),
      },
    );
  }
}
