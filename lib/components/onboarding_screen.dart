import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Future<SharedPreferences> _prefs;

  @override
  void initState() {
    super.initState();
    _prefs = SharedPreferences.getInstance();
  }

  Future<void> setSeenOnboard() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool('seenOnboard', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: <Widget>[
                buildPageContent(
                  title: 'Welcome to Our Application',
                  body: 'This is the first page of onboarding.',
                  image: 'assets/images/onboarding1.png',
                ),
                buildPageContent(
                  title: 'Explore Features',
                  body: 'This is the second page of onboarding.',
                  image: 'assets/images/onboarding1.png',
                ),
              ],
            ),
          ),
          buildPageIndicator(),
          currentPage == 1 ? buildBottomSheet() : const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget buildPageContent({required String title, required String body, required String image}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Text(body, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) => buildDot(index: index)),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget buildBottomSheet() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Get Started'),
        onPressed: () async {
          await setSeenOnboard();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen())
          );
        },
      ),
    );
  }
}