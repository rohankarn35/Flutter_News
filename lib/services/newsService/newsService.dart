import 'dart:convert';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/newModelHive.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class NewsService {
  final apikey = Secrets.apikey;
 
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=health';

  Future<void> fetchAndStoreNews() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl&apiKey=$apikey'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> articles = data['articles'];

        // Open the Hive box
        final box = Boxes.getData();

        for (var article in articles) {
          final NewsModel news = NewsModel.fromJson(article);
          final newsToHiveMode = NewsModelHive(
            title: news.title,
            description: news.description,
            newsUrl: news.newsUrl,
            imageUrl: news.imageUrl,
          );
          box.add(newsToHiveMode);
        }
      } else {
        throw Exception('Failed to fetch news');
      }
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }





}
