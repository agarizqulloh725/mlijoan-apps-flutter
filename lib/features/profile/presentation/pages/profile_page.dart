import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool switchValue = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          padding: EdgeInsets.all(3),
          child: Column(
            children: [
              profileCard(context),
              const SizedBox(height: 2),
              accountSettingsCard(context),
              const SizedBox(height: 2),
              appSettingsCard(context),
              const SizedBox(height: 2),
              supportCard(context),
              signOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileCard(BuildContext context) {
    return cardTemplate(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xFF73C4AE), width: 2),
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1586425225143-0c8f59053610?w=500&h=500',
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Muhammad Aga Rizqulloh', style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    Icon(Icons.phone, color: Color(0xFF73C4AE), size: 14),
                    SizedBox(width: 8),
                    Text('082253200756', style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.account_balance_wallet, color: Color(0xFF73C4AE), size: 14),
                    SizedBox(width: 8),
                    Text('Rp 0', style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget accountSettingsCard(BuildContext context) {
    return cardTemplate(
      children: [
        settingItem(Icons.shopping_bag_outlined, 'My Orders', context),
        settingItem(Icons.favorite_border, 'Wishlist', context),
        settingItem(Icons.location_on_outlined, 'Shipping Address', context),
        settingItem(Icons.payment, 'Payment Methods', context),
      ],
    );
  }

  Widget appSettingsCard(BuildContext context) {
    return cardTemplate(
      children: [
        settingItemWithSwitch('Notifications', context),
        settingItemWithText('Language', 'English', context),
      ],
    );
  }

  Widget supportCard(BuildContext context) {
    return cardTemplate(
      children: [
        settingItem(Icons.help_outline, 'Help Center', context),
        settingItem(Icons.privacy_tip_outlined, 'Privacy Policy', context),
      ],
    );
  }

Widget signOutButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () => print('Sign out button pressed'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    child: const Text(
      'Logout',
      style: TextStyle(color: Colors.white),
    ),
  );
}


  Widget settingItem(IconData icon, String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF73C4AE), size: 24),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        const Icon(Icons.chevron_right, color: Colors.grey),
      ],
    );
  }

  Widget settingItemWithSwitch(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.notifications_none, color: Color(0xFF73C4AE), size: 24),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        Switch(
          value: switchValue,
          onChanged: (bool value) {
            setState(() {
              switchValue = value;
            });
          },
          activeColor: const Color(0xFF73C4AE),
        ),
      ],
    );
  }

  Widget settingItemWithText(String title, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.language, color: Color(0xFF73C4AE), size: 24),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget cardTemplate({required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: children.map((child) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: child,
          )).toList(),
        ),
      ),
    );
  }
}
