import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static const String _userKey = 'safara_user_data';
  
  static Future<void> saveUserData({
    required String userId,
    required String name,
    required String email,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = {
      'userId': userId,
      'name': name,
      'email': email,
      'role': role,
    };
    await prefs.setString(_userKey, jsonEncode(userData));
  }
  
  static Future<Map<String, String>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(_userKey);
    if (userDataString == null) return null;
    
    return Map<String, String>.from(jsonDecode(userDataString));
  }
  
  static Future<String?> getUserName() async {
    final userData = await getUserData();
    return userData?['name'];
  }
  
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove('safara_jwt_token');
  }
  
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('safara_jwt_token') != null;
  }
}
