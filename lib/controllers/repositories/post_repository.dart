import 'package:blog_snake/controllers/interfaces/post_repository_interface.dart';
import 'package:blog_snake/controllers/services/api_client.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostRepository implements IPostRepository {
  final APIClient _client = APIClient();

  @override
  Future<Map<String, dynamic>?> getPosts(String? query) async {
    String url = '/blog/list${query != null ? "?search=$query" : ''}';

    final data = await _client.get(url);

    final results = data['results'] as List;

    final String? nextPage = data['next'];

    List<PostModel> posts = results
        .map<PostModel>((postJson) => PostModel.fromJson(postJson))
        .toList();

    return {'nextPage': nextPage, 'posts': posts};
  }


  @override
  Future<List<PostModel>> getUserPosts() async {
    const String url = '/blog/my-posts';

    final data = await _client.get(url);

    final results = data['data'] as List;


    List<PostModel> posts = results
        .map<PostModel>((postJson) => PostModel.fromJson(postJson))
        .toList();



    return posts;
  }


  @override
  Future<dynamic> getPostsNextPage(String? url) async {
    if (url != null) {
      url = url.substring(
        dotenv.env['BASE_URL']!.length,
      );

      final data = await _client.get(url);

      final results = data['results'] as List;

      final String? nextPage = data['next'];

      List<PostModel> posts = results
          .map<PostModel>((postJson) => PostModel.fromJson(postJson))
          .toList();

      return {'nextPage': nextPage, 'posts': posts};
    }
  }

  @override
  Future<PostModel> createPost(PostModel newPost) async {
    const String url = '/blog/create';

    Map<String, dynamic> data = newPost.toJson();
    String filename = data['image'].split('/').last;
    MapEntry<String, MultipartFile> image = MapEntry('image',
        await MultipartFile.fromFile(data['image'], filename: filename));

    data.removeWhere((key, value) => key == 'image');
    data.removeWhere((key, value) => key == 'author');
    data.removeWhere((key, value) => key == 'date_published');

    Map<String, dynamic> responseData =
        await _client.post(url, body: data, files: [image]);

    PostModel post = PostModel.fromJson(responseData['data']);
    return post;
  }

  @override
  Future<PostModel?> updatePost(PostModel newPost) async {
    final String url = '/blog/${newPost.slug}/update';

    Map<String, dynamic> data = newPost.toJson();

    try {
      String filename = data['image'].split('/').last;
      MapEntry<String, MultipartFile> image = MapEntry('image',
          await MultipartFile.fromFile(data['image'], filename: filename));

      data.removeWhere((key, value) => key == 'image');

      Map<String, dynamic> responseData =
          await _client.patch(url, body: data, files: [image]);

      PostModel post = PostModel.fromJson(responseData['data']);
      return post;
    } on Error {
      data.removeWhere((key, value) => key == 'image');
      Map<String, dynamic> responseData = await _client.patch(
        url,
        body: data,
      );
      PostModel post = PostModel.fromJson(responseData['data']);
      return post;
    }
  }

  @override
  Future<String> deletePost(PostModel post) async {
    return await _client.delete(post);
  }
}
