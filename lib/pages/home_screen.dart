import 'package:flutter/material.dart';
import '../services/auth_api_service.dart';
import 'package:provider/provider.dart';
import '../pages/auth/login_page.dart';
import '../models/user.dart';

class HomeScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentUser != null ? 'Welcome ${currentUser!.name}!' : 'No logged in user',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (currentUser == null)
              ElevatedButton(
                onPressed: _navigateToLogin,
                child: Text('Login'),
              ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi ketika tombol ditekan
              },
              child: Text('Next Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi ketika tombol ditekan
              },
              child: Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
