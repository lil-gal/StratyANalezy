import 'package:flutter/material.dart';

import 'package:nalezy/widget/footer.dart';

import 'package:nalezy/static_map_holder.dart';

class MapPage extends StatefulWidget {
  final String title;

  const MapPage({super.key, required this.title});

  @override
  State<MapPage> createState() => _MapPageState();
}



class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaticMap.widget,
      bottomNavigationBar: Footer(),
    );
  }
}
