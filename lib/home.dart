import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
        backgroundColor: Colors.orange, // Mengubah warna AppBar menjadi oranye
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuItem(context, Icons.dashboard, 'Dashboard', '/dashboard', Color(0xFF001F3F)), // Biru navy
                  _buildMenuItem(context, Icons.add, 'Add Sale', '/add', Color(0xFF001F3F)), // Biru navy
                  _buildMenuItem(context, Icons.update, 'Update Sale', '/update', Color(0xFF001F3F)), // Biru navy
                  _buildMenuItem(context, Icons.logout, 'Logout', '/login', Color(0xFF001F3F)), // Biru navy
                ],
              ),
              SizedBox(height: 50),
              Text('Nama : Muhammad Farhan Akbar Muhlis'),
              Text('NPM: 714220004'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, String route, Color color) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: color, // Mengatur warna kartu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white), // Warna ikon putih untuk kontras
            SizedBox(height: 10),
            Text(label, style: TextStyle(color: Colors.white)), // Warna teks putih untuk kontras
          ],
        ),
      ),
    );
  }
}
