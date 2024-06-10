import 'package:flutter/material.dart';
import 'package:neighborhood_watch_walnut/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: AppBar(
            centerTitle: true,
            title: const Text("WALNUT Neighborhood watch"),
            backgroundColor: Colors.orange,
          )),
      body: const HomePage(),
    ));
  }
}
