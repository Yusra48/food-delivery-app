import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = 'http://192.168.105.1:5000/api';

  Future<void> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/users/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        print('User created successfully');
      } else {
        print('Failed to create user: ${response.body}');
      }
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<dynamic> loginUser(Map<String, dynamic> credentials) async {
    final url = Uri.parse('$baseUrl/users/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body); 
      } else {
        print('Failed to login: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  Future<void> getUsers() async {
    final url = Uri.parse('$baseUrl/users');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);
        print('Users retrieved successfully: $users');
      } else {
        print('Failed to retrieve users: ${response.body}');
      }
    } catch (e) {
      print('Error retrieving users: $e');
    }
  }
}
