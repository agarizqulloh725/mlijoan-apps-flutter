import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../shared/utils/storage.dart';
import '../models/user.dart';
import '../../../../shared/utils/shared_preferences_manager.dart';

class AuthApiService {
  final String baseUrl = "https://api.mlijoan.com/api/v1/auth/";

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> login(String identifier, String password) async {
    var fullUrl = Uri.parse('${baseUrl}login');
    var requestBody = jsonEncode({'identifier': identifier, 'password': password});
    var response = await http.post(
      fullUrl,
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      await Storage.setToken(data['access_token']);
      await SharedPreferencesManager.saveBool("isLoggedIn", true);
      await _fetchUserDetails();
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    var token = await Storage.getToken();
    if (token != null) {
      var fullUrl = Uri.parse('${baseUrl}logout');
      await http.post(
        fullUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    }
    await Storage.deleteToken();
    await SharedPreferencesManager.saveBool("isLoggedIn", false);
    _currentUser = null;
  }

  Future<void> _fetchUserDetails() async {
    var token = await Storage.getToken();
    if (token == null) return;

    var fullUrl = Uri.parse('${baseUrl}me');
    var response = await http.get(
      fullUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      _currentUser = User.fromJson(json.decode(response.body));
    }
  }

  Future<User?> getUserDetails() async {
    if (_currentUser != null) return _currentUser; 
    await _fetchUserDetails();
    return _currentUser; 
  }
}
