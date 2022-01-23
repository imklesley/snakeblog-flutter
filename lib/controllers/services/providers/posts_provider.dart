import 'package:blog_snake/controllers/services/api_client.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:dio/dio.dart';

class PostsProvider {
  final APIClient _client = APIClient();

  Future<List<PostModel>> getPosts(String? query) async {
    String url = '/blog/list${query != null ? "&search=$query" : ''}';

    final data = await _client.get(url);

    final results = data['results'] as List;

    List<PostModel> posts = results
        .map<PostModel>((postJson) => PostModel.fromJson(postJson))
        .toList();

    return posts;
  }

  Future<Map<String, dynamic>> createPost(PostModel newPost) async {
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

    return responseData['data'];
  }
}
