import 'package:flutter/material.dart';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/offlienewsmodel.dart';
import 'package:flutter_news/services/firebaseService/showfavouritenews.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late Future<List<OfflineNewsModel>> futureNewsList;

  @override
  void initState() {
    super.initState();
    futureNewsList = getFavouriteNews();
  }

  Future<List<OfflineNewsModel>> getFavouriteNews() async {
    return ShowFavouriteNews().showFavouriteNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 10),
            child: GestureDetector(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.clear();
                Boxes.getData().clear();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            "Favourite News",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 18, 46),
      ),
      backgroundColor: Color.fromARGB(255, 2, 18, 46),
      body: Center(
        child: FutureBuilder<List<OfflineNewsModel>>(
          future: futureNewsList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.white),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text(
                "No favourite news found",
                style: TextStyle(color: Colors.white),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color.fromARGB(255, 2, 27, 70),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data![index].title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        snapshot.data![index].description,
                        style: TextStyle(color: Colors.white.withOpacity(0.3)),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
