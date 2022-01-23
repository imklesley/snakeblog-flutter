import 'package:blog_snake/controllers/interfaces/post_repository_interface.dart';
import 'package:blog_snake/controllers/services/providers/posts_provider.dart';
import 'package:blog_snake/models/post_model.dart';

class PostRepository implements IPostRepository {
  late PostsProvider _postsProvider;

  PostRepository() {
    _postsProvider = PostsProvider();
  }

  @override
  Future<List<PostModel>> getPosts(String? query) async {
    List<PostModel> posts = await _postsProvider.getPosts(query);
    return posts;
  }

  @override
  Future<PostModel> createPost(PostModel newPost) async {
    final data = await _postsProvider.createPost(newPost);
    PostModel post = PostModel.fromJson(data);
    return post;
  }
}
