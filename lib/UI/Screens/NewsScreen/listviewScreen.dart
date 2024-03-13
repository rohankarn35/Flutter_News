import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/newsView.dart';
import 'package:flutter_news/models/firebaseNewsModel.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/models/offlienewsmodel.dart';
import 'package:flutter_news/providers/newprovider.dart';
import 'package:flutter_news/services/firebaseService/favouriteNews.dart';
import 'package:provider/provider.dart';

class ListViewScreen extends StatelessWidget {
  final List<OfflineNewsModel> newsList;

  const ListViewScreen({required this.newsList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        final news = newsList[index];
        return Card(
            color: Color.fromARGB(255, 2, 27, 70),
            elevation: 4, // Adding elevation for a shadow effect
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Consumer<NewsProvider>(builder: (context, provider, child) {
              final newstoupload = FirebaseNewsModel(
                  title: news.title,
                  description: news.description,
                  newsUrl: news.newsUrl,
                  imageUrl: news.imagedata);
              return ListTile(
                trailing: GestureDetector(
                  onTap: () {
                    provider.addFavouriteNews(news.title);

                    !provider.favouriteNews.contains(news.title)
                        ? FavouriteNewsService().addFavourite(newstoupload)
                        : FavouriteNewsService().deleteFavourite(news.title);
                  },
                  child: Icon(
                    !provider.favouriteNews.contains(news.title)
                        ? Icons.favorite_outline
                        : Icons.favorite,
                    color: !provider.favouriteNews.contains(news.title)
                        ? Colors.white
                        : Colors.red,
                  ),
                ),
                contentPadding: EdgeInsets.all(16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  child: Image.memory(base64Decode(news.imagedata),
                      height: 100, width: 100, fit: BoxFit.cover),
                ),
                title: Text(
                  news.title.length > 15
                      ? '${news.title.substring(0, 15)}...'
                      : news.title.isEmpty
                          ? "Title Not Available"
                          : news.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15, // Increased font size for title
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    news.description.length > 20
                        ? news.description.substring(0, 20) + '...'
                        : news.description.isEmpty
                            ? "Description Not Available"
                            : news
                                .description, // Increased max lines for description
                    maxLines: 3, // Increased max lines for description
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 14,
                    ),
                  ),
                ),
                onTap: () {
                  // print(news.description);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsWebView(url: news.newsUrl),
                    ),
                  );
                },
              );
            }));
      },
    );
  }
}
