import 'package:flutter/material.dart';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/services/newsService/newsService.dart';

class NewsProvider extends ChangeNotifier {
  bool _isGrid = true;

  bool get isGrid => _isGrid;

  void changeView() {
    _isGrid = !_isGrid;
    notifyListeners();
  }

  List<NewsModel> newsList = [];
  bool isLoading = false;
  getNewsData() async {
    final box = Boxes.getData();
    box.clear();
    isLoading = true;
    await NewsService().fetchAndStoreNews();
    isLoading = false;
    print(box.length);
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i);
      newsList.add(NewsModel(
          title: data!.title,
          description: data.description,
          imageUrl: data.imageUrl,
          newsUrl: data.newsUrl));
    }
    notifyListeners();
  }
  bool isNewsViewLoading = true;
  updateLoading(bool value){
    isNewsViewLoading = value;
    notifyListeners();
  }
}
