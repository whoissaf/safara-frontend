import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class ApiService {
  static Future<Map<String, dynamic>> submitReport({
    required String userId,
    required String locationId,
    required String category,
    required String title,
    required String description,
  }) async {
    final url = Uri.parse('${AppConstants.baseUrl}/reports');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': userId,
          'location_id': locationId,
          'category': category,
          'title': title,
          'description': description,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return {'success': true, 'data': data['data']};
      } else {
        return {'success': false, 'message': data['message'] ?? 'Failed to submit report'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }
}
