// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$nextPageUrlAtom = Atom(name: 'HomeStoreBase.nextPageUrl');

  @override
  String? get nextPageUrl {
    _$nextPageUrlAtom.reportRead();
    return super.nextPageUrl;
  }

  @override
  set nextPageUrl(String? value) {
    _$nextPageUrlAtom.reportWrite(value, super.nextPageUrl, () {
      super.nextPageUrl = value;
    });
  }

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

  final _$isLoadingAtom = Atom(name: 'HomeStoreBase.isLoading');

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

  final _$isLoadingMorePostsAtom =
      Atom(name: 'HomeStoreBase.isLoadingMorePosts');

  @override
  bool get isLoadingMorePosts {
    _$isLoadingMorePostsAtom.reportRead();
    return super.isLoadingMorePosts;
  }

  @override
  set isLoadingMorePosts(bool value) {
    _$isLoadingMorePostsAtom.reportWrite(value, super.isLoadingMorePosts, () {
      super.isLoadingMorePosts = value;
    });
  }

  final _$scaffoldKeyAtom = Atom(name: 'HomeStoreBase.scaffoldKey');

  @override
  GlobalKey<ScaffoldState> get scaffoldKey {
    _$scaffoldKeyAtom.reportRead();
    return super.scaffoldKey;
  }

  @override
  set scaffoldKey(GlobalKey<ScaffoldState> value) {
    _$scaffoldKeyAtom.reportWrite(value, super.scaffoldKey, () {
      super.scaffoldKey = value;
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

  final _$getNextPageAsyncAction = AsyncAction('HomeStoreBase.getNextPage');

  @override
  Future<void> getNextPage() {
    return _$getNextPageAsyncAction.run(() => super.getNextPage());
  }

  final _$createNewPostAsyncAction = AsyncAction('HomeStoreBase.createNewPost');

  @override
  Future<void> createNewPost(PostModel newPost) {
    return _$createNewPostAsyncAction.run(() => super.createNewPost(newPost));
  }

  final _$updatePostAsyncAction = AsyncAction('HomeStoreBase.updatePost');

  @override
  Future<PostModel?> updatePost(PostModel post) {
    return _$updatePostAsyncAction.run(() => super.updatePost(post));
  }

  final _$deletePostAsyncAction = AsyncAction('HomeStoreBase.deletePost');

  @override
  Future<String> deletePost(PostModel post) {
    return _$deletePostAsyncAction.run(() => super.deletePost(post));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void toggleDrawer() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.toggleDrawer');
    try {
      return super.toggleDrawer();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nextPageUrl: ${nextPageUrl},
posts: ${posts},
isLoading: ${isLoading},
isLoadingMorePosts: ${isLoadingMorePosts},
scaffoldKey: ${scaffoldKey}
    ''';
  }
}
