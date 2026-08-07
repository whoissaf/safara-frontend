import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'location_detail_screen.dart';
import '../widgets/empty_state_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _activeLevels = [];
  String? _selectedCategory;
  bool _verifiedOnly = false;

  final List<Map<String, dynamic>> _allLocations = const [
    {'name': 'Monas, Jakarta', 'level': 'Yellow', 'color': NeoColors.yellow, 'category': 'Theft', 'verified': true},
    {'name': 'Bundaran HI', 'level': 'Green', 'color': NeoColors.green, 'category': 'Scam', 'verified': true},
    {'name': 'Kota Tua', 'level': 'Orange', 'color': NeoColors.orange, 'category': 'Violence', 'verified': false},
    {'name': 'Malioboro', 'level': 'Green', 'color': NeoColors.green, 'category': 'Traffic Accident', 'verified': true},
    {'name': 'Pantai Kuta', 'level': 'Yellow', 'color': NeoColors.yellow, 'category': 'Natural Disaster', 'verified': false},
    {'name': 'Borobudur', 'level': 'Green', 'color': NeoColors.green, 'category': 'Health Emergency', 'verified': true},
    {'name': 'Puncak Bogor', 'level': 'Orange', 'color': NeoColors.orange, 'category': 'Other', 'verified': false},
    {'name': 'Ancol Jakarta', 'level': 'Red', 'color': NeoColors.red, 'category': 'Theft', 'verified': true},
  ];

  final List<String> _categories = ['Theft', 'Scam', 'Violence', 'Natural Disaster', 'Traffic Accident', 'Health Emergency', 'Other'];

  List<Map<String, dynamic>> get _filteredLocations {
    return _allLocations.where((loc) {
      bool matchesSearch = loc['name'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
      bool matchesLevel = _activeLevels.isEmpty || _activeLevels.contains(loc['level']);
      bool matchesCategory = _selectedCategory == null || loc['category'] == _selectedCategory;
      bool matchesVerified = !_verifiedOnly || loc['verified'] == true;
      return matchesSearch && matchesLevel && matchesCategory && matchesVerified;
    }).toList();
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Advanced Filter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  const SizedBox(height: AppSpacing.lg),
                  
                  const Text('Attention Level', style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: 8,
                    children: ['Green', 'Yellow', 'Orange', 'Red'].map((level) {
                      final isActive = _activeLevels.contains(level);
                      return GestureDetector(
                        onTap: () {
                          setModalState(() {
                            if (isActive) _activeLevels.remove(level);
                            else _activeLevels.add(level);
                          });
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isActive ? NeoColors.primary : NeoColors.surface,
                            border: NeoBorders.thin,
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                          child: Text(level, style: TextStyle(fontWeight: FontWeight.w900, color: isActive ? NeoColors.surface : NeoColors.primary)),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  const Text('Category', style: TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                    items: [const DropdownMenuItem(value: null, child: Text('All Categories')), ..._categories.map((c) => DropdownMenuItem(value: c, child: Text(c)))],
                    onChanged: (val) {
                      setModalState(() => _selectedCategory = val);
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  Row(
                    children: [
                      const Text('Verified Only', style: TextStyle(fontWeight: FontWeight.w900)),
                      const Spacer(),
                      Switch(
                        value: _verifiedOnly,
                        onChanged: (val) {
                          setModalState(() => _verifiedOnly = val);
                          setState(() {});
                        },
                        activeColor: NeoColors.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('APPLY FILTERS'),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredLocations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Safara'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: _showFilterSheet),
          Padding(padding: const EdgeInsets.only(right: AppSpacing.md), child: CircleAvatar(backgroundColor: NeoColors.accent, child: const Icon(Icons.person, color: NeoColors.black))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.accent, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Hello, Traveler', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)), SizedBox(height: AppSpacing.sm), Text('Where are you going today?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900))]),
            ),
            const SizedBox(height: AppSpacing.xl),
            Container(
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(hintText: 'Search Location, City, Country...', prefixIcon: Icon(Icons.search), border: InputBorder.none, contentPadding: EdgeInsets.all(AppSpacing.md)),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Trending Locations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)), TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(fontWeight: FontWeight.w900)))]),
            const SizedBox(height: AppSpacing.md),
            
            if (results.isEmpty)
              const EmptyStateWidget(
                title: 'No Locations Found',
                message: 'Try adjusting your search or filter criteria.',
                icon: Icons.search_off,
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: AppSpacing.md, mainAxisSpacing: AppSpacing.md, childAspectRatio: 0.85),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final loc = results[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())),
                    child: Container(
                      decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: Container(decoration: BoxDecoration(color: (loc['color'] as Color).withOpacity(0.3), border: const Border(bottom: NeoBorders.thickSide), borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.md))), child: Center(child: Icon(Icons.location_on, size: 40, color: loc['color'] as Color)))),
                          Expanded(flex: 1, child: Padding(padding: const EdgeInsets.all(AppSpacing.sm), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(loc['name'] as String, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis), const SizedBox(height: 4), Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: loc['color'] as Color, border: NeoBorders.thin), child: Text('${loc['level']}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900)))]))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            
            const SizedBox(height: AppSpacing.xl),
            const Text('Latest Advisory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: NeoColors.yellow, border: NeoBorders.thin), child: const Icon(Icons.warning_amber, size: 24)), const SizedBox(width: AppSpacing.md), const Expanded(child: Text('Petty Theft in Tourist Zones', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)))]), const SizedBox(height: AppSpacing.md), const Text('Stay alert in crowded areas. Recent reports indicate minor incidents.', style: TextStyle(fontSize: 14))]),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Text('Government Advisory', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.hard, borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: NeoColors.red, border: NeoBorders.thin), child: const Icon(Icons.gavel, color: NeoColors.surface, size: 24)), const SizedBox(width: AppSpacing.md), const Expanded(child: Text('New Travel Restriction Policy', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)))]), const SizedBox(height: AppSpacing.md), const Text('Official government update regarding new entry requirements for certain regions.', style: TextStyle(fontSize: 14))]),
            ),
          ],
        ),
      ),
    );
  }
}
