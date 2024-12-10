import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/onboarding_screen.dart';
import 'pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboard = prefs.getBool('seenOnboard') ?? false;

  runApp(MyApp(seenOnboard: seenOnboard));
}

class MyApp extends StatelessWidget {
  final bool seenOnboard;

  MyApp({required this.seenOnboard});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: seenOnboard ? HomeScreen() : OnboardingScreen(),
    );
  }
}
