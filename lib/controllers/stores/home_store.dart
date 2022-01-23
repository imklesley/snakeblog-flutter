import 'package:blog_snake/controllers/repositories/post_repository.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  late PostRepository postRepository;

  HomeStoreBase() {
    postRepository = PostRepository();
  }

  @observable
  ObservableList<PostModel> posts = ObservableList<PostModel>();

  @action
  Future<void> getAllPosts() async {
    var data = await postRepository.getPosts(null);
    posts.addAll(data);
  }

  @action
  Future<void> searchPosts(String query) async {
    var data = await postRepository.getPosts(query);
    posts.clear();
    posts.addAll(data);
  }

  @action
  Future<void> createNewPost(newPost) async {
    posts.add(await postRepository.createPost(newPost));
  }
}
