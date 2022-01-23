import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'author_model.dart';

class PostModel {
  PostModel({
    required this.title,
    required this.body,
    required this.image,
    this.author,
    this.datePublished,
  });

  late final String title;
  late final String body;
  late final String image;
  late final AuthorModel? author;
  late final String? datePublished;

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = dotenv.env['BASE_URL']!.replaceFirst('/api', '') + json['image'];
    author = AuthorModel.fromJson(json['author']);
    datePublished = json['date_published'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['body'] = body;
    _data['image'] = image;
    if (author != null) {
      _data['author'] = author!.toJson();
    }
    if (datePublished != null) {
      _data['date_published'] = datePublished;
    }
    return _data;
  }
}
