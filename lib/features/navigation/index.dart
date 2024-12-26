import 'package:flutter/material.dart';
import '../../shared/widgets/appbar.dart';
import '../../shared/widgets/navbar.dart';
import '../auth/presentation/pages/login_page.dart';
import '../cart/presentation/pages/cart_page.dart';
import '../home/presentation/pages/home_page.dart';
import '../message/presentation/pages/message_page.dart';
import '../profile/presentation/pages/profile_page.dart';
import '../transaction/presentation/pages/transactions_page.dart';
import '../wishlist/presentation/pages/wishlist_page.dart';
import '../../shared/utils/shared_preferences_manager.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    bool? isLoggedIn = await SharedPreferencesManager.getBool("isLoggedIn");
    setState(() {
      _isUserLoggedIn = isLoggedIn ?? false;
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
      resizeToAvoidBottomInset: false,
      appBar: _selectedIndex == 3
          ? null
          : MyAppBar(
              onSearch: (value) {},
              onCart: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage())),
              onMessage: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagePage())),
            ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavbar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
      ),
    );
  }
}
