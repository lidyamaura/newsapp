import 'package:mobb/home-news-detail.dart';
import 'package:mobb/services.dart';
import 'package:mobb/news.dart';
import 'package:flutter/material.dart';

class HomeNews extends StatefulWidget {
  final String category;
  const HomeNews({Key? key, required this.category}) : super(key: key);

  @override
  State<HomeNews> createState() => _HomeState();
}

class _HomeState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      backgroundColor: Color(0xFF94A684),
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
                  "List News",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              FutureBuilder<List<News>>(
                future: NewsService.fetchNews(widget.category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      List<News> newsList = snapshot.data!;

                      return SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            News news = newsList[index];

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Material(
                                color: Color(0xFFE4E4D0),
                                elevation: 2,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeNewsDetail(
                                            news: news,
                                          ),
                                        ),
                                      )
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image(
                                            image: NetworkImage(
                                                news.thumbnail ?? '')),
                                        Text(
                                          news.title ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          news.pubDate ?? '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
