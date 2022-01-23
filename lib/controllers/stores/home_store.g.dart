// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$postsAtom = Atom(name: 'HomeStoreBase.posts');

  @override
  ObservableList<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$getAllPostsAsyncAction = AsyncAction('HomeStoreBase.getAllPosts');

  @override
  Future<void> getAllPosts() {
    return _$getAllPostsAsyncAction.run(() => super.getAllPosts());
  }

  final _$searchPostsAsyncAction = AsyncAction('HomeStoreBase.searchPosts');

  @override
  Future<void> searchPosts(String query) {
    return _$searchPostsAsyncAction.run(() => super.searchPosts(query));
  }

  final _$createNewPostAsyncAction = AsyncAction('HomeStoreBase.createNewPost');

  @override
  Future<void> createNewPost(dynamic newPost) {
    return _$createNewPostAsyncAction.run(() => super.createNewPost(newPost));
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
