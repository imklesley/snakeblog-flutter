// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserPostStore on UserPostStoreBase, Store {
  final _$postsAtom = Atom(name: 'UserPostStoreBase.posts');

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

  final _$isLoadingAtom = Atom(name: 'UserPostStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getUserPostsAsyncAction =
      AsyncAction('UserPostStoreBase.getUserPosts');

  @override
  Future<void> getUserPosts() {
    return _$getUserPostsAsyncAction.run(() => super.getUserPosts());
  }

  @override
  String toString() {
    return '''
posts: ${posts},
isLoading: ${isLoading}
    ''';
  }
}
