import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'author_model.dart';

class PostModel {
  PostModel({
    required this.title,
    required this.body,
    this.image,
    required this.tag,
    this.slug,
    this.author,
    this.datePublished,
  });

  late final String? slug;
  late final String title;
  late final String body;
  late final String? image;
  late final String tag;
  late final AuthorModel? author;
  late final DateTime? datePublished;

  PostModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    title = json['title'];
    body = json['body'];
    image = dotenv.env['BASE_URL']!.replaceFirst('/api', '') + json['image'];
    tag = json['tag'];
    author = AuthorModel.fromJson(json['author']);
    datePublished = DateTime.parse(json['date_published']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['title'] = title;
    _data['body'] = body;
    _data['image'] = image;
    _data['tag'] = tag;
    if (author != null) {
      _data['author'] = author!.toJson();
    }
    if (datePublished != null) {
      _data['date_published'] = datePublished.toString();
    }
    return _data;
  }
}
