// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  final _$userAtom = Atom(name: 'AppStoreBase.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isUserAuthenticatedAtom =
      Atom(name: 'AppStoreBase.isUserAuthenticated');

  @override
  bool get isUserAuthenticated {
    _$isUserAuthenticatedAtom.reportRead();
    return super.isUserAuthenticated;
  }

  @override
  set isUserAuthenticated(bool value) {
    _$isUserAuthenticatedAtom.reportWrite(value, super.isUserAuthenticated, () {
      super.isUserAuthenticated = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'AppStoreBase.isLoading');

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

  final _$saveUserAsyncAction = AsyncAction('AppStoreBase.saveUser');

  @override
  Future<void> saveUser(UserModel? newUser) {
    return _$saveUserAsyncAction.run(() => super.saveUser(newUser));
  }

  final _$logoutUserAsyncAction = AsyncAction('AppStoreBase.logoutUser');

  @override
  Future<void> logoutUser() {
    return _$logoutUserAsyncAction.run(() => super.logoutUser());
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isUserAuthenticated: ${isUserAuthenticated},
isLoading: ${isLoading}
    ''';
  }
}
