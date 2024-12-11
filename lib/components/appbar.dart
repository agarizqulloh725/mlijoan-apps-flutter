import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onSearch;
  final Function onCart;
  final Function onMessage;

  const MyAppBar({super.key, required this.onSearch, required this.onCart, required this.onMessage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 35,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Sayur Bayam',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(
                    color: Colors.black,   
                    fontSize: 13,          
                  ),
                  onChanged: (value) => onSearch(value),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildIconButton(Icons.shopping_cart, onCart),
                  _buildIconButton(Icons.message, onMessage),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildIconButton(IconData icon, Function onPressed) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: Icon(icon, color: Colors.white),
            tooltip: 'Cart',
            onPressed: () => onPressed(),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '1', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
