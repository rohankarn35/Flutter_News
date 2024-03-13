import 'package:flutter/material.dart';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/firebaseNewsModel.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/models/offlienewsmodel.dart';
import 'package:flutter_news/services/firebaseService/favouriteNews.dart';
import 'package:flutter_news/services/newsService/newsService.dart';
import 'package:flutter_news/utils/offlienimageutils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsProvider extends ChangeNotifier {
  bool _isGrid = true;

  bool get isGrid => _isGrid;

  void changeView() {
    _isGrid = !_isGrid;
    notifyListeners();
  }

  List<OfflineNewsModel> newsList = [];
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
      newsList.add(OfflineNewsModel(
          title: data!.title,
          description: data.description,
          imagedata:  data.imageUrl,
          newsUrl: data.newsUrl));
    }
    notifyListeners();
  }
  bool isoffline = false;

  getNewsDataWhenOffline() {
    isoffline = true;
    final box = Boxes.getData();
    for (int i = 0; i < box.length; i++) {
      final data = box.getAt(i);
      newsList.add(OfflineNewsModel(
          title: data!.title,
          description: data.description,
          imagedata: data.imageUrl,
          newsUrl: data.newsUrl));
    }
    notifyListeners();
  }

  bool isNewsViewLoading = true;
  updateLoading(bool value) {
    isNewsViewLoading = value;
    notifyListeners();
  }

  bool isFavourite = false;
  updateFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  List<String> favouriteNews = [];

  void addFavouriteNews(String newtitle) async {
    favouriteNews = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> news = prefs.getStringList("favouriteNews") ?? [];
    if (news.contains(newtitle)) {
      news.remove(newtitle);
    } else {
      news.add(newtitle);
    }
    favouriteNews = news;
    prefs.setStringList("favouriteNews", news);
    notifyListeners();
  }
  toogleDeletionfirebase(bool val, OfflineNewsModel news){
   if (val) {
       final newstoupload = FirebaseNewsModel(
                            title: news.title,
                            description: news.description,
                            newsUrl: news.newsUrl,
                            imageUrl: news.imagedata);
      FavouriteNewsService().addFavourite(newstoupload);

    
     
   }else{
      FavouriteNewsService().deleteFavourite(news.title);
   }

  }
}
