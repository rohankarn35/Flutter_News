import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/favouriteNewsScreen.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/gridViewScreen.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/listviewScreen.dart';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/providers/newprovider.dart';
import 'package:flutter_news/services/firebaseService/showfavouritenews.dart';
import 'package:flutter_news/services/newsService/newsService.dart';
import 'package:flutter_news/utils/internetChecker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void isConnected() async {
    if (await Internetchecker().isInternetConnected()) {
      Provider.of<NewsProvider>(context, listen: false).getNewsData();
    } else {
      Provider.of<NewsProvider>(context, listen: false)
          .getNewsDataWhenOffline();
    }
  }

  @override
  void initState() {

    isConnected();
    final box = Boxes.getData();
    print(box.length);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 2, 18, 46),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 2, 18, 46),
            centerTitle: true,
            title: Padding(
              padding:
                  EdgeInsets.only(top: 16.0), // Adjust top padding as needed
              child:
                  Text("Flutter News", style: TextStyle(color: Colors.white)),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(top: 16,),
                  child: GestureDetector(
                    
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
                    },
                    child: Icon(Icons.bookmark, color: Colors.white))),
              Padding(
                padding: const EdgeInsets.only(top: 16,right: 5),
                child: IconButton(
                  icon: Icon(
                    provider.isGrid
                        ? Icons.list_rounded
                        : Icons.grid_view_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    provider.changeView();
                  },
                ),
              ),
            ],
          ),
          body: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : provider.isGrid
                  ? Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: GridViewScreen(newsList: provider.newsList),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: ListViewScreen(newsList: provider.newsList),
                    ),
        );
      },
    );
  }
}
