import 'package:flutter/material.dart';
import '../../services/auth_api_service.dart';
import '../../home_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _identifierController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _identifierController,
              decoration: const InputDecoration(labelText: 'email / phone'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

void _login(BuildContext context) async {
  try {
    print("Login button clicked");
    final authApi = Provider.of<AuthApiService>(context, listen: false);  

    bool success = await authApi.login(
      _identifierController.text,
      _passwordController.text,
    );

    print("Login attempt status: $success");  

    if (success) {
      print("Login successful, navigating to home screen.");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), // Navigate to HomeScreen on successful login
      );
    } else {
      print("Login failed, showing snackbar.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Failed'))
      ); // Show snackbar on failed login
    }
  } catch (e) {
    // Handle errors like Provider not found or any exceptions from the AuthApiService
    print("An error occurred during login: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('An error occurred during login. Please try again.'))
    );
  }
}
}
