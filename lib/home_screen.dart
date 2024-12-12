import 'package:flutter/material.dart';
import 'components/appbar.dart';
import 'components/navbar.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/transactions_page.dart';
import 'pages/wishlist_page.dart';
import 'pages/auth/login_page.dart';
import '../utils/storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isUserLoggedIn = false;

  final List<Widget> _screens = [
    const HomePage(),
    const WishlistPage(),
    const TransactionsPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _checkLoggedInUser();
  }

  void _checkLoggedInUser() async {
    var token = await Storage.getToken();
    setState(() {
      _isUserLoggedIn = token != null;
    });
  }

  void _onItemTapped(int index) {
    if (!_isUserLoggedIn) {
      _navigateToLogin();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 3
          ? null
          : MyAppBar(
              onSearch: (value) {},
              onCart: () {},
              onMessage: () {},
            ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
