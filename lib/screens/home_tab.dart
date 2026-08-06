import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'location_detail_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  final List<Map<String, dynamic>> _locations = const [
    {'name': 'Monas, Jakarta', 'level': 'Yellow', 'color': NeoColors.yellow},
    {'name': 'Bundaran HI', 'level': 'Green', 'color': NeoColors.green},
    {'name': 'Kota Tua', 'level': 'Orange', 'color': NeoColors.orange},
    {'name': 'Malioboro', 'level': 'Green', 'color': NeoColors.green},
    {'name': 'Pantai Kuta', 'level': 'Yellow', 'color': NeoColors.yellow},
    {'name': 'Borobudur', 'level': 'Green', 'color': NeoColors.green},
    {'name': 'Puncak Bogor', 'level': 'Orange', 'color': NeoColors.orange},
    {'name': 'Ancol Jakarta', 'level': 'Red', 'color': NeoColors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safara'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: CircleAvatar(
              backgroundColor: NeoColors.accent,
              child: const Icon(Icons.person, color: NeoColors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: NeoColors.accent,
                border: Border.all(color: NeoColors.black, width: 3),
                boxShadow: NeoShadows.hard,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Traveler', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Where are you going today?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending Locations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(fontWeight: FontWeight.w900))),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                childAspectRatio: 0.85,
              ),
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                final loc = _locations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())),
                  child: Container(
                    decoration: BoxDecoration(
                      color: NeoColors.surface,
                      border: NeoBorders.thick,
                      boxShadow: NeoShadows.small,
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: (loc['color'] as Color).withOpacity(0.3),
                              border: const Border(bottom: NeoBorders.thick),
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.md)),
                            ),
                            child: Center(child: Icon(Icons.location_on, size: 40, color: loc['color'] as Color)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.sm),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(loc['name'] as String, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: loc['color'] as Color, border: Border.all(color: NeoColors.black, width: 2)),
                                  child: Text('${loc['level']}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Latest Advisory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: NeoColors.surface,
                border: NeoBorders.thick,
                boxShadow: NeoShadows.hard,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: NeoColors.yellow, border: NeoBorders.thin), child: const Icon(Icons.warning_amber, size: 24)),
                      const SizedBox(width: AppSpacing.md),
                      const Expanded(child: Text('Petty Theft in Tourist Zones', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16))),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const Text('Stay alert in crowded areas. Recent reports indicate minor incidents.', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
