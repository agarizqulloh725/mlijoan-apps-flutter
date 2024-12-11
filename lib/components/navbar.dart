import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  // Constructor menerima parameter selectedIndex dan onItemTapped
  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped, // Menangani saat item navbar dipilih
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 24, // Ukuran ikon
            color: selectedIndex == 0 ? Colors.teal : Colors.black, // Mengubah warna ikon saat dipilih
          ),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border, // Ikon Wishlist
            size: 24, // Ukuran ikon
            color: selectedIndex == 1 ? Colors.teal : Colors.black, // Mengubah warna ikon saat dipilih
          ),
          label: 'Wishlist',
          tooltip: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.payment, // Ikon Transaksi
            size: 24, // Ukuran ikon
            color: selectedIndex == 2 ? Colors.teal : Colors.black, // Mengubah warna ikon saat dipilih
          ),
          label: 'Transaksi',
          tooltip: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle, // Ikon Profile
            size: 24, // Ukuran ikon
            color: selectedIndex == 3 ? Colors.teal : Colors.black, // Mengubah warna ikon saat dipilih
          ),
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
      // Menyesuaikan ukuran dan warna label saat dipilih
      selectedLabelStyle: const TextStyle(
        fontSize: 12, // Ukuran font label saat terpilih
        color: Colors.teal, // Warna label saat terpilih
        fontWeight: FontWeight.bold, // Gaya font tebal saat terpilih
      ),
      // Menyesuaikan ukuran dan warna label saat tidak dipilih
      unselectedLabelStyle: const TextStyle(
        fontSize: 10, // Ukuran font label saat tidak terpilih
        color: Colors.black, // Warna label saat tidak terpilih
      ),
      // Mengatur warna ikon yang tidak dipilih menjadi hitam
      unselectedItemColor: Colors.black,
      // Mengatur warna ikon yang dipilih menjadi teal
      selectedItemColor: Colors.teal,
    );
  }
}
