import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../utils/shared_preferences_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

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

  // Konten untuk setiap halaman onboarding
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

  // Menampilkan indikator halaman onboarding
  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) => buildDot(index: index)),
    );
  }

  // Membuat dot indikator untuk page view
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

  // Membuat tombol "Get Started" di halaman onboarding terakhir
  Widget buildBottomSheet() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Get Started'),
        onPressed: () async {
          // Menyimpan status onboarding telah dilihat menggunakan SharedPreferencesManager
          await SharedPreferencesManager.saveBool('seenOnboard', true);
          
          // Arahkan ke halaman utama
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
      ),
    );
  }
}
