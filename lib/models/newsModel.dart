class NewsModel {
  String title;
  String description;
  String newsUrl;
  String imageUrl;

  NewsModel(
      {required this.title,
      required this.description,
      required this.newsUrl,
      required this.imageUrl});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title']??'',
      description: json['description']??'',
      newsUrl: json['url']??'',
      imageUrl: json['urlToImage']??'https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
    );
  }
}
