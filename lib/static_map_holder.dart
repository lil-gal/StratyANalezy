

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class _staticMapClass {
  final FlutterMap widget;

  const _staticMapClass(this.widget);
}


var StaticMap = _staticMapClass(FlutterMap(
  options: const MapOptions(
    initialCenter: LatLng(48.720, 19.742),
    initialZoom: 8,
  ),
  children: [
    TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: 'straty_a_nalezy-indev', 
    ),
  ],
));