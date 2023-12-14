import 'package:flutter/material.dart';
import 'package:mobb/home-news.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        backgroundColor: Color(0xFF94A684), // Warna B2A59B
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
        toolbarHeight: 120.0, // Set the desired height
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Mau Baca Berita Apa Hari Ini?',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 140, 139, 139)),
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  // Handle search functionality here
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFF94A684), // Warna FAEED1
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kategori Berita',
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 3, 3),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  CustomButton('Trending', 'terbaru',
                      'https://i.pinimg.com/564x/e0/2d/c5/e02dc5bf6d73ab84ecb7f497526045e8.jpg'),
                  CustomButton('Politik', 'politik',
                      'https://i.pinimg.com/564x/af/02/7b/af027bfb4d02c094fa04a683c159c1b8.jpg'),
                  CustomButton('Hukum', 'hukum',
                      'https://i.pinimg.com/564x/69/7e/42/697e4238f0b408df553fcd1d046576a3.jpg'),
                  CustomButton('Ekonomi', 'ekonomi',
                      'https://i.pinimg.com/564x/e0/ba/8f/e0ba8fe780e1d7b1298b5c95c11fea86.jpg'),
                  CustomButton('Sepak Bola', 'bola',
                      'https://i.pinimg.com/564x/c9/84/49/c98449dc0a70708e46425421db0b9fd9.jpg'),
                  CustomButton('Olahraga', 'olahraga',
                      'https://i.pinimg.com/736x/21/31/c7/2131c70df326ffcb9828f1f48e0ca9f8.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String category;
  final String imageUrl;

  const CustomButton(this.buttonText, this.category, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          height: 100, // Set the desired height
          width: 100, // Set the desired width
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            // Navigasi ke halaman HomeNews dengan mengirimkan nilai string
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNews(category: category),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 150, 88, 147)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(8.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
