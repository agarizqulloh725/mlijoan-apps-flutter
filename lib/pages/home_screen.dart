import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_api_service.dart';
import '../pages/auth/login_page.dart';
import '../models/user.dart';
import '../components/appbar.dart';
import '../components/navbar.dart';  // Import BottomNavbar widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? currentUser;
  int _selectedIndex = 0;

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

  // Fungsi untuk menangani pemilihan item navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        onSearch: _onSearch,
        onCart: _onCart,
        onMessage: _onMessage,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentUser != null
                    ? 'Welcome ${currentUser!.name}!'
                    : 'No logged in user',
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
      ),
      // Menggunakan widget BottomNavbar
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,  // Menangani pemilihan item navbar
      ),
    );
  }
}
