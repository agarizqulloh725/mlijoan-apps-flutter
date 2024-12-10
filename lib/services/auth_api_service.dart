import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/storage.dart';

class AuthApiService {
  final String baseUrl = "http://10.0.2.2:8000/api/v1/auth/";

Future<bool> login(String email, String password) async {
  // Create the full URL for the login request
  var fullUrl = Uri.parse(baseUrl + 'login');
  print('Request URL: $fullUrl');

  // Prepare the body of the request with the provided email and password
  var requestBody = jsonEncode({'email': email, 'password': password});
  print('Request Body: $requestBody');

  // Send a POST request to the login URL
  var response = await http.post(
    fullUrl,
    headers: {'Content-Type': 'application/json'},
    body: requestBody,
  );

  // Print the entire response from the server
  print('HTTP Response: $response');

  // Check the status code of the response
  if (response.statusCode == 200) {
    // Decode the JSON response body
    var data = json.decode(response.body);
    print('Response Data: $data');

    // Store the access token using a hypothetical Storage class
    await Storage.setToken(data['access_token']);
    return true;
  } else {
    // Log an error if the login failed
    print('Login failed with status code: ${response.statusCode}');
  }
  return false;
}

  Future<void> logout() async {
    await Storage.deleteToken();
  }

  Future<Map<String, dynamic>?> getUserDetails() async {
    var token = await Storage.getToken();
    if (token == null) return null;

    var response = await http.get(
      Uri.parse(baseUrl + 'me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }
}
