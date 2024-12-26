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
      onTap: onItemTapped, 
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 24, 
            color: selectedIndex == 0 ? Colors.teal : Colors.black, 
          ),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border, 
            size: 24, 
            color: selectedIndex == 1 ? Colors.teal : Colors.black,
          ),
          label: 'Wishlist',
          tooltip: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.payment,
            size: 24, 
            color: selectedIndex == 2 ? Colors.teal : Colors.black, 
          ),
          label: 'Transaksi',
          tooltip: 'Transaksi',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            size: 24, 
            color: selectedIndex == 3 ? Colors.teal : Colors.black, 
          ),
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
      selectedLabelStyle: const TextStyle(
        fontSize: 12, 
        color: Colors.teal, 
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
        color: Colors.black,
      ),
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.teal,
    );
  }
}
