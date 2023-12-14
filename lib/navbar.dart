import 'package:mobb/category.dart';
import 'package:mobb/home.dart';
import 'package:mobb/home-news.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [
    Home(),
    Category(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Community'),
        ],
        selectedItemColor: Color.fromARGB(255, 4, 77, 80),
        unselectedItemColor: Color.fromARGB(255, 142, 200, 210),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 30,
      ),
    );
  }
}
