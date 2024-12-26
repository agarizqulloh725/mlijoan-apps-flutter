import 'package:flutter/material.dart';
import 'shared/utils/shared_preferences_manager.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'features/navigation/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool seenOnboard = await SharedPreferencesManager.getBool('seenOnboard') ?? false;

  runApp(MyApp(seenOnboard: seenOnboard));
}

class MyApp extends StatelessWidget {
  final bool seenOnboard;

  const MyApp({super.key, required this.seenOnboard});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: seenOnboard ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
