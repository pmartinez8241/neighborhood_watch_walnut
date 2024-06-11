import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MapBottomNavigationBar extends ConsumerWidget {
  const MapBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: const Icon(Icons.list), label: 'Report List'),
          const BottomNavigationBarItem(
              icon: const Icon(
                Icons.question_mark_sharp,
              ),
              label: "FAQ")
        ],
        onTap: (value) => {
              if (value == 0) {Navigator.pushNamed(context, "/markerlist")},
            });
  }
}
