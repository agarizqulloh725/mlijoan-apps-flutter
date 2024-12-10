import 'package:flutter/material.dart';
import '../../services/auth_api_service.dart';
import '../../pages/home_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

void _login(BuildContext context) async {
  try {
    print("Login button clicked");
    final authApi = Provider.of<AuthApiService>(context, listen: false);  // Fetch the AuthApiService instance

    bool success = await authApi.login(
      _emailController.text,
      _passwordController.text,
    );

    print("Login attempt status: $success");  // Debug console output for login status.

    if (success) {
      print("Login successful, navigating to home screen.");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen on successful login
      );
    } else {
      print("Login failed, showing snackbar.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed'))
      ); // Show snackbar on failed login
    }
  } catch (e) {
    // Handle errors like Provider not found or any exceptions from the AuthApiService
    print("An error occurred during login: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred during login. Please try again.'))
    );
  }
}
}
