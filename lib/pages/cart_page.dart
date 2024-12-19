import 'package:flutter/material.dart';
import 'package:mlijoan_apps/components/navbar_cart.dart';

class ShoppingCartModel {
  bool? checkboxValue1 = false;
  bool? checkboxValue2 = true;

  void dispose() {}
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ShoppingCartModel _model = ShoppingCartModel();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: _model.checkboxValue1,
                          onChanged: (bool? newValue) {
                            setState(() => _model.checkboxValue1 = newValue);
                          },
                        ),
                        title: const Text('Sayur bayam kualitas super', style: TextStyle(fontSize: 16.0)),
                        subtitle: const Text('Rp 19.000'),
                        trailing: const QuantityButtons(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavbarCart(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      iconTheme: const IconThemeData(color: Colors.white),
      leadingWidth: 25, 
      title: const Text(
        'Keranjang',
        style: TextStyle(
          color: Colors.white, 
          fontSize: 18 
        )
      ),
      centerTitle: false,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class QuantityButtons extends StatelessWidget {
  const QuantityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {},
        ),
        const Text('1'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}



