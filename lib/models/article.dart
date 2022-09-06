import 'dart:convert';

class Article {
  String title;
  String url;
  String urlToImage;
  Article({
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  Article copyWith({
    String? title,
    String? url,
    String? urlToImage,
  }) {
    return Article(
      title: title ?? this.title,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ??
          'https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg',
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));

  @override
  String toString() =>
      'Article(title: $title, url: $url, urlToImage: $urlToImage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Article &&
        other.title == title &&
        other.url == url &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode ^ urlToImage.hashCode;
}
