import 'package:blog_snake/models/post_model.dart';

abstract class IPostRepository {

  Future<List<PostModel>> getPosts(String? query) async {
    throw UnimplementedError();
  }

  Future<void> createPost(PostModel newPost) async{
    throw UnimplementedError();
  }







}
