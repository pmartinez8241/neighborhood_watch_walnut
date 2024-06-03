import 'package:flutter/material.dart';
import 'package:neighborhood_watch_walnut/pages/walnut_map.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [WalnutMap()]),
    );
  }
}
