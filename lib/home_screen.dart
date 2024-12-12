import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_api_service.dart';
import 'components/appbar.dart';
import 'components/navbar.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/transactions_page.dart';
import 'pages/wishlist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const WishlistPage(),
    const TransactionsPage(),
    const ProfilePage(),
  ];

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
      setState(() {});
    }
  }

  void _onSearch(String value) {
  }

  void _onCart() {
  }

  void _onMessage() {
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _selectedIndex == 3
          ? null
          : MyAppBar(
              onSearch: _onSearch,
              onCart: _onCart,
              onMessage: _onMessage,
            ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
