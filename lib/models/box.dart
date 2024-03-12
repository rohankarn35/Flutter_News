import 'package:flutter_news/models/newModelHive.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<NewsModelHive> getData() {
    return Hive.box<NewsModelHive>("newsBox");
  }
}
