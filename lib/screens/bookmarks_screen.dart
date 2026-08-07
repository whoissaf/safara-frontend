import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../services/bookmark_service.dart';
import 'location_detail_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Map<String, dynamic>> _bookmarks = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final data = await BookmarkService.getBookmarks();
    setState(() => _bookmarks = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: _bookmarks.isEmpty
          ? const Center(child: Text('No bookmarks yet', style: TextStyle(fontWeight: FontWeight.w700)))
          : ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: _bookmarks.length,
              itemBuilder: (context, index) {
                final loc = _bookmarks[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationDetailScreen())),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(color: NeoColors.surface, border: NeoBorders.thick, boxShadow: NeoShadows.small, borderRadius: BorderRadius.circular(AppRadius.md)),
                    child: Row(
                      children: [
                        Container(width: 50, height: 50, decoration: BoxDecoration(color: (loc['color'] as Color).withOpacity(0.3), border: NeoBorders.thin, borderRadius: BorderRadius.circular(AppRadius.sm)), child: Icon(Icons.location_on, color: loc['color'] as Color)),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(loc['name'] as String, style: const TextStyle(fontWeight: FontWeight.w900)), Text(loc['level'] as String, style: const TextStyle(fontSize: 12))])),
                        IconButton(icon: const Icon(Icons.delete, color: NeoColors.red), onPressed: () async {
                          await BookmarkService.removeBookmark(loc['name'] as String);
                          _loadBookmarks();
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
