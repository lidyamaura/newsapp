import 'package:flutter/material.dart';
import 'category.dart'; // Gantilah dengan path yang sesuai

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF304D30), // Warna 053B50
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang di Aplikasi news",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              "Aplikasi ini memberikan informasi terbaru dan menarik seputar berita.",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Category
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Category()),
                );
              },
              child: Text("Mulai"),
            ),
          ],
        ),
      ),
    );
  }
}
