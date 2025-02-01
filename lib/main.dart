import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlijoan_apps/shared/utils/injection.dart';
import 'shared/utils/shared_preferences_manager.dart';
import 'features/onboarding/presentation/pages/onboarding_screen.dart';
import 'features/navigation/index.dart';

void main() async {
  await initLocator();
  WidgetsFlutterBinding.ensureInitialized();
  bool seenOnboard = await SharedPreferencesManager.getBool('seenOnboard') ?? false;

  runApp(MyApp(seenOnboard: seenOnboard));
}

class MyApp extends StatelessWidget {
  final bool seenOnboard;

  const MyApp({super.key, required this.seenOnboard});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
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
