import 'dart:math';

import 'package:dio/dio.dart';
import 'package:mobb/news.dart';

class NewsService {
  static Future<List<News>> fetchNews(String category) async {
    Response response = await Dio()
        .get('https://api-berita-indonesia.vercel.app/antara/' + category);
    List<News> news = (response.data['data']['posts'] as List)
        .map((v) => News.fromJson(v))
        .toList();
    return news;
  }
}
