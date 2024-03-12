import 'package:hive/hive.dart';
part 'newModelHive.g.dart';

@HiveType(typeId: 0)
class NewsModelHive extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String newsUrl;
  @HiveField(3)
  String imageUrl;
  NewsModelHive(
      {required this.title,
      required this.description,
      required this.newsUrl,
      required this.imageUrl});
}
