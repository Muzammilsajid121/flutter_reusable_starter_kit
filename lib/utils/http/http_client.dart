import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = 'https://qmsapi.studybrainiacs.com/api'; 
  
  // Is variable mein hum login ke baad token save kar sakte hain
  static String? _authToken;

  // Token set karne ka function (Login ke baad call karein)
  static void setToken(String token) {
    _authToken = token;
  }

  // Headers generate karne ka common function
  static Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (_authToken != null) 'Authorization': 'Bearer $_authToken',
    };
  }

  // --- GET ---
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
    );
    return _handleResponse(response);
  }

  // --- POST ---
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // --- Response Handling ---
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final Map<String, dynamic> decodedData = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decodedData;
    } else {
      // Server se aane wala error message throw karna
      throw Exception(decodedData['message'] ?? 'Something went wrong: ${response.statusCode}');
    }
  }
}