import 'dart:io';

import 'package:mobb/news.dart';
import 'package:flutter/material.dart';

class HomeNewsDetail extends StatelessWidget {
  final News news;

  const HomeNewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail News"),
        backgroundColor: Color(0xFFF2F1EB), // Warna background AppBar
      ),
      backgroundColor: Color(0xFFAEC3AE), // Warna background Scaffold
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: const Text(
                  "Detail News",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Material(
                  color: Color(0xFFEEE7DA),
                  elevation: 2,
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: NetworkImage(news.thumbnail ?? '')),
                        Text(
                          news.title ?? 'No title',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          news.description ?? 'No description',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '\n' + (news.link ?? 'No link'),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
