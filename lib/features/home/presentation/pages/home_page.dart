import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/flashsale.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10), 
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  height: 180,
                  onPageChanged: (index, reason) {},
                ),
                items: imageSliders(context),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: Text(
                  "Kategori",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromARGB(170, 0, 0, 0)
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Wrap(
                  spacing: 10,
                  children: <Widget>[
                      categoryButton(context, "Sayuran", Icons.eco, const Color.fromARGB(100, 139, 195, 74)),
                      categoryButton(context, "Daging", Icons.restaurant, const Color.fromARGB(100, 33, 149, 243)),
                      categoryButton(context, "Buah", Icons.apple, const Color.fromARGB(100, 76, 175, 79)), 
                      categoryButton(context, "Bumbu", Icons.local_dining, const Color.fromARGB(100, 244, 67, 54)), 
                      categoryButton(context, "Lainnya", Icons.more_horiz, const Color.fromARGB(100, 158, 158, 158)), 
                  ],

                ),
              ),
            ),
            const SizedBox(height: 10),
            flashSaleSection(),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }

Widget categoryButton(BuildContext context, String label, IconData icon, Color color) {
  double width = MediaQuery.of(context).size.width / 4; 
  return SizedBox(
    width: width - 12,
    child: ElevatedButton(
    onPressed: () {
        debugPrint('Button pressed: $label');
      },
      style: ElevatedButton.styleFrom(
        shadowColor: color,
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: Size(width, 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: Colors.white), 
          Text(label, style: TextStyle(color: Colors.white)), 
        ],
      ),
    ),
  );
}


List<Widget> imageSliders(BuildContext context) => [
  InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
    },
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          "https://images.ctfassets.net/wn7ipiv9ue5v/5GNali325l7StGbMK2vfjh/bf7d821c70a8d782278f2e8c6b499b0b/TS25-DLX-RETAIL-DIGITAL-BANNERS-D2C-640x360.jpg",
          // "https://149450327.v2.pressablecdn.com/wp-content/uploads/2017/04/640x360.png",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
  InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage()));
    },
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          "https://images.ctfassets.net/wn7ipiv9ue5v/5GNali325l7StGbMK2vfjh/bf7d821c70a8d782278f2e8c6b499b0b/TS25-DLX-RETAIL-DIGITAL-BANNERS-D2C-640x360.jpg",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
];
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Page")),
      body: const Center(child: Text("You're on the detail page!")),
    );
  }
}
