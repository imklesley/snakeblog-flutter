







import 'package:blog_snake/controllers/repositories/post_repository.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:mobx/mobx.dart';


part 'user_posts_store.g.dart';

class UserPostStore = UserPostStoreBase with _$UserPostStore;

abstract class UserPostStoreBase with Store{

  late PostRepository postRepository;

  UserPostStoreBase() {
    postRepository = PostRepository();
    getUserPosts();
  }


  @observable
  ObservableList<PostModel> posts = ObservableList<PostModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> getUserPosts() async {

    isLoading = true;
    posts.addAll(await postRepository.getUserPosts());

    isLoading = false;
  }
}