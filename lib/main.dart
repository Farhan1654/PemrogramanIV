import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/add_sale.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/update_sale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/dashboard': (context) => DashboardPage(),
        '/add': (context) => AddSalePage(),
        '/update': (context) => UpdateSalePage(),
        '/login': (context) => LoginPage(),
      },
      // Menambahkan error builder untuk menangani kesalahan navigasi
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => HomePage(), // Ganti dengan halaman default
      ),
    );
  }
}
