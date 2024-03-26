import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/service/new_service.dart';
import 'package:fresh_flash/model/news_tesla_model.dart';


class SportsProvider with ChangeNotifier {
  NewsApiResModel? _newsApiResModel;
  NewsApiResModel? get newsApiResModel => _newsApiResModel;
  bool isloading = false;
  String error = '';
  Future<void> sport() async {
    try {
      print('11');
      isloading = true;
      _newsApiResModel = await ServiceApi().sports();
      print(_newsApiResModel!.status.toString());
      isloading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
      print(e);
    }
  }
}