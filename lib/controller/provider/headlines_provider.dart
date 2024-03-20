import 'package:flutter/material.dart';
import 'package:fresh_flash/controller/service/new_service.dart';
import 'package:fresh_flash/model/top_headlines_model.dart';

class HeadlinesProvider with ChangeNotifier {
  TopHeadlinesResModel? _topHeadlinesResModel;
  TopHeadlinesResModel? get topHeadlinesResModel => _topHeadlinesResModel;
  bool isloading = false;
  String error = '';
  Future<void> headlines() async {
    try {
      print('11');
      isloading = true;
      _topHeadlinesResModel = await ServiceApi().topHeadlines();
      print(_topHeadlinesResModel!.status.toString());
      isloading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
      print(e);
    }
  }
}