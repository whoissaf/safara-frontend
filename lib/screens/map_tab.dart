import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../core/constants.dart';
import 'location_detail_screen.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Container(
          decoration: BoxDecoration(border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: FlutterMap(
              options: const MapOptions(initialCenter: LatLng(-6.2088, 106.8456), initialZoom: 10.0),
              children: [
                TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.safara.app'),
                MarkerLayer(markers: [
                  Marker(width: 40, height: 40, point: const LatLng(-6.1754, 106.8272), child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())), child: const Icon(Icons.location_on, color: NeoColors.yellow, size: 40))),
                  Marker(width: 40, height: 40, point: const LatLng(-6.1944, 106.8229), child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())), child: const Icon(Icons.location_on, color: NeoColors.green, size: 40))),
                  Marker(width: 40, height: 40, point: const LatLng(-6.1352, 106.8133), child: GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())), child: const Icon(Icons.location_on, color: NeoColors.orange, size: 40))),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
