import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget flashSaleSection() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.0), 
          const Color.fromARGB(86, 0, 150, 135),                   
        ],
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Flash sale",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(130, 0, 0, 0)
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.red, 
                        borderRadius: BorderRadius.circular(20), 
                      ),
                      child: const Text(
                        "2:18:06",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(70, 0, 0, 0), 
                      width: 1.2,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 12,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: const BoxDecoration(
            ),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  productCard("Rp288.090", "Rp1.009.000", "-74%", "assets/product1.png"),
                  productCard("Rp2.286.00", "Rp2.595.000", "-12%", "assets/product2.png"),
                  productCard("Rp494.505", "Rp565.000", "-11%", "assets/product3.png"),
                  productCard("Rp2.505.73", "Rp3.299.000", "-24%", "assets/product4.png"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget productCard(String price, String originalPrice, String discount, String imagePath) {
  return Container(
    width: 72, 
    margin: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      // border: Border.all(
      //   color: Colors.grey,
      //   width: 1.0,
      // ),
    ),
  );
}