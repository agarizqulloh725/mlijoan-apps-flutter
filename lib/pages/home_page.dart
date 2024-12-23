import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next Page'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Open Settings'),
            ),
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
          "https://149450327.v2.pressablecdn.com/wp-content/uploads/2017/04/640x360.png",
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
