import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../core/constants.dart';
import 'location_detail_screen.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final MapController _mapController = MapController();
  final LatLng _jakarta = const LatLng(-6.2088, 106.8456);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _jakarta,
              initialZoom: 12.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.safara.app',
                maxNativeZoom: 19,
                tileSize: 256,
                zoomOffset: 0,
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: const LatLng(-6.1754, 106.8272),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LocationDetailScreen()),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: NeoColors.yellow,
                        size: 50,
                      ),
                    ),
                  ),
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: const LatLng(-6.1944, 106.8229),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LocationDetailScreen()),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: NeoColors.green,
                        size: 50,
                      ),
                    ),
                  ),
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: const LatLng(-6.1352, 106.8133),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LocationDetailScreen()),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: NeoColors.orange,
                        size: 50,
                      ),
                    ),
                  ),
                  Marker(
                    width: 60.0,
                    height: 60.0,
                    point: const LatLng(-6.1700, 106.8270),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LocationDetailScreen()),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: NeoColors.red,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: AppSpacing.xl,
            right: AppSpacing.lg,
            child: FloatingActionButton(
              onPressed: () {
                _mapController.move(_jakarta, 12.0);
              },
              backgroundColor: NeoColors.primary,
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }
}
