import 'package:blog_snake/models/post_model.dart';

abstract class IPostRepository {

  Future<Map<String,dynamic>?> getPosts(String? query) async {
    throw UnimplementedError();
  }

  Future<List<PostModel>> getUserPosts() async {
    throw UnimplementedError();
  }


  Future<dynamic> getPostsNextPage(String query) async {
    throw UnimplementedError();
  }




  Future<void> createPost(PostModel newPost) async{
    throw UnimplementedError();
  }

  Future<PostModel?> updatePost(PostModel newPost) async{
    throw UnimplementedError();
  }

  Future<String> deletePost(PostModel post) async{
    throw UnimplementedError();
  }








}
