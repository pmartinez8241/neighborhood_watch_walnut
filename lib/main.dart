import 'package:flutter/material.dart';
import 'package:neighborhood_watch_walnut/pages/home.dart';
import 'package:neighborhood_watch_walnut/pages/walnut_map.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (context) => WalnutMap()},
    );
  }
}
