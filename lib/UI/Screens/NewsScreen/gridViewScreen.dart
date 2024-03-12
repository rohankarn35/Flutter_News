import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/newsView.dart';
import 'package:flutter_news/models/newsModel.dart';

class GridViewScreen extends StatelessWidget {
  final List<NewsModel> newsList;

  const GridViewScreen({required this.newsList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        final news = newsList[index];
        return Card(
          color: Color.fromARGB(255, 2, 27, 70),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsWebView(
                    url: news.newsUrl,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        news.imageUrl,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        news.title.length > 15
                            ? news.title.substring(0, 15) + '...'
                            : news.title.isEmpty
                                ? "Title Not Available"
                                : news.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Text(
                        news.description.length > 30
                            ? news.description.substring(0, 30) + '...'
                            : news.description.isEmpty
                                ? "Description Not Available"
                                : news.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 10,
                  bottom: 15,
                  child: GestureDetector(
                    onTap: (){
                      print("Favourite");
                    },
                    child: Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
