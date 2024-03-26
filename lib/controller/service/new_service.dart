import 'dart:convert';
import 'package:fresh_flash/model/news_tesla_model.dart';
import 'package:fresh_flash/model/top_headlines_model.dart';
import 'package:http/http.dart' as http;

final String APIKEY = '5169cff4fedd4e559678b7c7149a9a81';

class ServiceApi {
  /// automobile
  Future<NewsApiResModel> fetchNews() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=2024-02-26&sortBy=publishedAt&apiKey=5169cff4fedd4e559678b7c7149a9a81'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return NewsApiResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  /// top headlines
  Future<TopHeadlinesResModel> topHeadlines() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=$APIKEY'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return TopHeadlinesResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }

  /// electronics
  Future<NewsApiResModel> electronics() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=apple&from=2024-03-19&to=2024-03-19&sortBy=popularity&apiKey=$APIKEY'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return NewsApiResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
  /// Sports
    Future<NewsApiResModel> sports() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=$APIKEY'),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      return NewsApiResModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
  
}
