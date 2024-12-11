import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/storage.dart';
import '../models/user.dart';

class AuthApiService {
  final String baseUrl = "http://10.0.2.2:8000/api/v1/auth/";

  Future<bool> login(String email, String password) async {
    var fullUrl = Uri.parse(baseUrl + 'login');
    print('Request URL: $fullUrl');

    var requestBody = jsonEncode({'email': email, 'password': password});
    print('Request Body: $requestBody');
    var response = await http.post(
      fullUrl,
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );
    print('HTTP Response: $response');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Response Data: $data');

      await Storage.setToken(data['access_token']);
      return true;
    } else {
      print('Login failed with status code: ${response.statusCode}');
    }
    return false;
  }

  Future<bool> register(String name, String phone, String email, String password) async {
    var fullUrl = Uri.parse(baseUrl + 'register');
    print('Request URL: $fullUrl');

    var requestBody = jsonEncode({
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    });
    print('Request Body: $requestBody');

    var response = await http.post(
      fullUrl,
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );
    print('HTTP Response: $response');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print('Response Data: $data');

      await Storage.setToken(data['access_token']);
      return true;
    } else {
      print('Registration failed with status code: ${response.statusCode}');
      return false;
    }
  }

  Future<void> logout() async {
    var token = await Storage.getToken();
    if (token != null) {
      var fullUrl = Uri.parse(baseUrl + 'logout');
      var response = await http.post(
        fullUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('Logout HTTP Response: $response');
    }
    await Storage.deleteToken();
  }

  Future<bool> refresh() async {
    var token = await Storage.getToken();
    if (token == null) return false;

    var fullUrl = Uri.parse(baseUrl + 'refresh');
    var response = await http.get(
      fullUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Refresh HTTP Response: $response');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      await Storage.setToken(data['access_token']);
      return true;
    }
    return false;
  }

  // Future<Map<String, dynamic>?> getUserDetails() async {
  //   var token = await Storage.getToken();
  //   if (token == null) return null;

  //   var response = await http.get(
  //     Uri.parse(baseUrl + 'me'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   }
  //   return null;
  // }

    Future<User?> getUserDetails() async {
    var token = await Storage.getToken();
    if (token == null) return null;

    var fullUrl = Uri.parse(baseUrl + 'me');
    var response = await http.get(
      fullUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }
    return null;
  }
}
