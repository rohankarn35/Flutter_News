import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/newsView.dart';
import 'package:flutter_news/models/newsModel.dart';

class ListViewScreen extends StatelessWidget {
  final List<NewsModel> newsList;

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
          child: ListTile(
            trailing: GestureDetector(
              onTap: () {
                print("Favourite");
              
              },
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            ),
            contentPadding: EdgeInsets.all(16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Image.network(
                news.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              news.title.length > 15
                  ? news.title.substring(0, 15) + '...'
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
              print(news.description);
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsWebView(
                    url: news.newsUrl,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
