import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi ketika tombol ditekan
              },
              child: Text('Next Page'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi ketika tombol ditekan
              },
              child: Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
