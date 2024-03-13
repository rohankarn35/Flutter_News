import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_news/models/offlienewsmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowFavouriteNews {
  final CollectionReference favouriteNews =
      FirebaseFirestore.instance.collection('news');

  Future<List<OfflineNewsModel>> showFavouriteNews() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userEmail = prefs.getString("email") ?? "";

    // Get the document snapshot for the specified user email
    DocumentSnapshot userDoc = await favouriteNews.doc(userEmail).get();
    if (userDoc.exists) {
      // Get the current favourites array
      List<dynamic> favourites = userDoc.get('favouriteNews');
      List<OfflineNewsModel> newsList = [];
      for (var favourite in favourites) {
        newsList.add(OfflineNewsModel(
            title: favourite['title'],
            description: favourite['description'],
            imagedata: favourite['imageUrl'],
            newsUrl: favourite['newsUrl']));
      }
      return newsList;
    } else {
      print('User document with email "$userEmail" not found.');
      return [];
    }
  }
}
