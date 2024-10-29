import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, String>> salesData = [
    {
      'no_faktur': '001',
      'tanggal': '2024-11-01',
      'nama_customer': 'Customer Agus',
      'jumlah_barang': '10',
      'total_penjualan': 'Rp 1,000,000',
    },
    {
      'no_faktur': '002',
      'tanggal': '2024-10-05',
      'nama_customer': 'Customer Budi',
      'jumlah_barang': '5',
      'total_penjualan': 'Rp 900,000',
    },
    {
      'no_faktur': '003',
      'tanggal': '2024-09-10',
      'nama_customer': 'Customer Caca',
      'jumlah_barang': '7',
      'total_penjualan': 'Rp 800,000',
    },
  ];

  final TextEditingController noFakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController namaCustomerController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController totalPenjualanController = TextEditingController();

  void _addSale() {
    setState(() {
      salesData.add({
        'no_faktur': noFakturController.text,
        'tanggal': tanggalController.text,
        'nama_customer': namaCustomerController.text,
        'jumlah_barang': jumlahBarangController.text,
        'total_penjualan': totalPenjualanController.text,
      });
    });
    noFakturController.clear();
    tanggalController.clear();
    namaCustomerController.clear();
    jumlahBarangController.clear();
    totalPenjualanController.clear();
  }

  void _showDetail(Map<String, String> sale) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detail Penjualan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('No Faktur: ${sale['no_faktur']}'),
              Text('Tanggal: ${sale['tanggal']}'),
              Text('Nama Customer: ${sale['nama_customer']}'),
              Text('Jumlah Barang: ${sale['jumlah_barang']}'),
              Text('Total Penjualan: ${sale['total_penjualan']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Daftar Penjualan', style: TextStyle(fontSize: 24)),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('+ Tambah Data Penjualan'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: noFakturController,
                                  decoration: InputDecoration(labelText: 'No Faktur'),
                                ),
                                TextField(
                                  controller: tanggalController,
                                  decoration: InputDecoration(labelText: 'Tanggal'),
                                ),
                                TextField(
                                  controller: namaCustomerController,
                                  decoration: InputDecoration(labelText: 'Nama Customer'),
                                ),
                                TextField(
                                  controller: jumlahBarangController,
                                  decoration: InputDecoration(labelText: 'Jumlah Barang'),
                                ),
                                TextField(
                                  controller: totalPenjualanController,
                                  decoration: InputDecoration(labelText: 'Total Penjualan'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Tutup'),
                            ),
                            TextButton(
                              onPressed: () {
                                _addSale();
                                Navigator.of(context).pop();
                              },
                              child: Text('Simpan'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('+ Tambah Data Penjualan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final sale = salesData[index];
                  return GestureDetector(
                    onTap: () => _showDetail(sale),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('No Faktur: ${sale['no_faktur']}', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text('Tanggal: ${sale['tanggal']}'),
                            Text('Nama Customer: ${sale['nama_customer']}'),
                            Text('Jumlah Barang: ${sale['jumlah_barang']}'),
                            Text('Total Penjualan: ${sale['total_penjualan']}'),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Pastikan '/home' adalah rute yang sesuai
              },
              child: Text('Kembali'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
