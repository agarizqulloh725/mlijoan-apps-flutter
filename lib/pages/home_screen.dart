import 'package:flutter/material.dart';
import '../services/auth_api_service.dart';
import 'package:provider/provider.dart';
import '../pages/auth/login_page.dart';
import '../models/user.dart';
import '../components/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? currentUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoggedInUser();
    });
  }

  void _checkLoggedInUser() async {
    var userDetails = await Provider.of<AuthApiService>(context, listen: false).getUserDetails();
    if (userDetails != null) {
      setState(() {
        currentUser = userDetails;
      });
    }
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _onSearch(String value) {
    // Handle search functionality
  }

  void _onCart() {
    // Handle cart button press
  }

  void _onMessage() {
    // Handle message button press
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onSearch: _onSearch,
        onCart: _onCart,
        onMessage: _onMessage,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentUser != null ? 'Welcome ${currentUser!.name}!' : 'No logged in user',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (currentUser == null)
              ElevatedButton(
                onPressed: _navigateToLogin,
                child: const Text('Login'),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
