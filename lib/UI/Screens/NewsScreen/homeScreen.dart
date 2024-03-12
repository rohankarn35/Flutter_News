import 'package:flutter/material.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/gridViewScreen.dart';
import 'package:flutter_news/UI/Screens/NewsScreen/listviewScreen.dart';
import 'package:flutter_news/models/box.dart';
import 'package:flutter_news/models/newsModel.dart';
import 'package:flutter_news/providers/newprovider.dart';
import 'package:flutter_news/services/newsService/newsService.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<NewsProvider>(context, listen: false).getNewsData();
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
                padding: const EdgeInsets.only(top: 16),
                child: IconButton(
                  icon: Icon(provider.isGrid
                      ? Icons.list_rounded
                      : Icons.grid_view_rounded,color: Colors.white,),
                  onPressed: () {
                    provider.changeView();
                  },
                ),
              ),
            ],
          ),
          body: provider.isLoading
              ? Center(child: CircularProgressIndicator())
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
