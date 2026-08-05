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
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(-6.2088, 106.8456), // Jakarta
              initialZoom: 10.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.safara.app',
              ),
              MarkerLayer(
                markers: [
                  // Monas - Yellow
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(-6.1754, 106.8272),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LocationDetailScreen()),
                        );
                      },
                      child: const Icon(
                        Icons.location_on_rounded,
                        color: AppColors.yellow,
                        size: 40,
                      ),
                    ),
                  ),
                  // Bundaran HI - Green
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(-6.1944, 106.8229),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LocationDetailScreen()),
                        );
                      },
                      child: const Icon(
                        Icons.location_on_rounded,
                        color: AppColors.green,
                        size: 40,
                      ),
                    ),
                  ),
                  // Kota Tua - Orange
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: const LatLng(-6.1352, 106.8133),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LocationDetailScreen()),
                        );
                      },
                      child: const Icon(
                        Icons.location_on_rounded,
                        color: AppColors.orange,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: AppSpacing.xxl,
            right: AppSpacing.lg,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.my_location_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
