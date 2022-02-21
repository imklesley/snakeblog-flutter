import 'package:blog_snake/controllers/repositories/post_repository.dart';
import 'package:blog_snake/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  late PostRepository postRepository;

  HomeStoreBase() {
    postRepository = PostRepository();
    getAllPosts();
  }

  @observable
  String? nextPageUrl;

  @observable
  ObservableList<PostModel> posts = ObservableList<PostModel>();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMorePosts = false;

  @observable
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @action
  void toggleDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  @action
  Future<void> getAllPosts() async {
    isLoading = true;
    var data = await postRepository.getPosts(null);

    if (data != null) {
      nextPageUrl = data['nextPage'] as String?;
      posts.clear();
      posts.addAll(data['posts'] as List<PostModel>);
    }

    isLoading = false;
  }

  @action
  Future<void> searchPosts(String query) async {
    isLoading = true;
    var data = await postRepository.getPosts(query);

    if (data != null) {
      nextPageUrl = data['nextPage'] as String?;
      posts.clear();
      posts.addAll(data['posts'] as List<PostModel>);
    }

    isLoading = false;
  }

  @action
  Future<void> getNextPage() async {
    isLoadingMorePosts = true;

    //TODO: Remover isso aqui, é somente para testar
    // await Future.delayed(const Duration(seconds: 5));

    var data = await postRepository.getPostsNextPage(nextPageUrl);

    if (data != null) {
      nextPageUrl = data['nextPage'] as String?;
      posts.addAll(data['posts']);
    }

    isLoadingMorePosts = false;
  }

  @action
  Future<void> createNewPost(PostModel newPost) async {
    isLoading = true;
    posts.insert(0, await postRepository.createPost(newPost));
    isLoading = false;
  }

  @action
  Future<PostModel?> updatePost(PostModel post) async {
    isLoading = true;

    PostModel? postUpdated = await postRepository.updatePost(post);

    if (postUpdated != null) {
      posts[posts.indexWhere((element) => element.slug == post.slug)] =
          postUpdated;
    }

    isLoading = false;

    return postUpdated;
  }

  @action
  Future<String> deletePost(PostModel post) async {
    isLoading = true;

    var data = await postRepository.deletePost(post);
    posts.remove(post);

    isLoading = false;
    return data;
  }
}
