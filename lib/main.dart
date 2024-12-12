import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/onboarding_screen.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import 'services/auth_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboard = prefs.getBool('seenOnboard') ?? false;

  runApp(MyApp(seenOnboard: seenOnboard));
}

class MyApp extends StatelessWidget {
  final bool seenOnboard;

  const MyApp({super.key, required this.seenOnboard});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthApiService>(
      create: (_) => AuthApiService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: seenOnboard ? const HomeScreen() : const OnboardingScreen(),
      ),
    );
  }
}
