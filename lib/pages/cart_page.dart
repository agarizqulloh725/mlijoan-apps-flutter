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
                    return CartItem(
                      checkboxValue: _model.checkboxValue1,
                      title: 'Sayur bayam kualitas super',
                      subtitle: 'Rp 18.000',
                      imageUrl: 'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
                      discount: 30,
                      onChanged: (bool? newValue) {
                        setState(() => _model.checkboxValue1 = newValue);
                      },
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

class CartItem extends StatelessWidget {
  final bool? checkboxValue;
  final String title;
  final String subtitle;
  final String imageUrl;
  final int discount;
  final void Function(bool?) onChanged;

  const CartItem({
    super.key,
    required this.checkboxValue,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.discount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Checkbox(value: checkboxValue, onChanged: onChanged),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              if (discount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: Colors.red,
                  child: Text('$discount%', style: const TextStyle(color: Colors.white, fontSize: 14)),
                ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(title, style: const TextStyle(fontSize: 14.0), maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(text: 'Rp 15.000', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w900, fontSize: 13.0)),
                        const WidgetSpan(child: SizedBox(width: 8)),
                        TextSpan(text: subtitle, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 10.0)),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  color: Colors.white,
                  child: const QuantityButtons(),
                )
              ],
            ),
          ),
        ],
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
      title: const Text('Keranjang', style: TextStyle(color: Colors.white, fontSize: 18)),
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
        IconButton(icon: const Icon(Icons.indeterminate_check_box), onPressed: () {}),
        const Text('1'),
        IconButton(icon: const Icon(Icons.add_box), onPressed: () {}),
      ],
    );
  }
}
