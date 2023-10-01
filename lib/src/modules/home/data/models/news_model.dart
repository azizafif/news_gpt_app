import '../../../../api/exports.dart';

class NewsModel extends ModelingProtocol {
  List<Article>? articles;

  NewsModel({this.articles});
  @override
  NewsModel? fromJson(dynamic json) => NewsModel(
        articles: (json["articles"] as List).map((element) => Article.fromJson(element)).toList(),
      );

  @override
  List<Object?> get props => [articles];
}

class Article {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source;

  Article({this.title, this.description, this.content, this.url, this.image, this.publishedAt, this.source});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json['title'],
        description: json['description'],
        content: json['content'],
        url: json['url'],
        image: json['image'],
        publishedAt: json['publishedAt'],
        source: json['source'] != null ? Source.fromJson(json['source'] as StringKeyedMap) : null,
      );
}

class Source {
  String? name;
  String? url;

  Source({this.name, this.url});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
