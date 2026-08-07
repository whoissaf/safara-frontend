import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService {
  static const String _key = 'safara_bookmarks';

  static Future<List<Map<String, dynamic>>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key);
    if (data == null) return [];
    return data.map((e) => Map<String, dynamic>.from(jsonDecode(e))).toList();
  }

  static Future<void> addBookmark(Map<String, dynamic> location) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    final jsonStr = jsonEncode(location);
    if (!data.contains(jsonStr)) {
      data.add(jsonStr);
      await prefs.setStringList(_key, data);
    }
  }

  static Future<void> removeBookmark(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key) ?? [];
    data.removeWhere((e) {
      final map = Map<String, dynamic>.from(jsonDecode(e));
      return map['name'] == name;
    });
    await prefs.setStringList(_key, data);
  }

  static Future<bool> isBookmarked(String name) async {
    final bookmarks = await getBookmarks();
    return bookmarks.any((b) => b['name'] == name);
  }
}
