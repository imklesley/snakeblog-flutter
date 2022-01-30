import 'dart:convert';

import 'package:blog_snake/models/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

const userKey = 'userKey';

abstract class AppStoreBase with Store {
  AppStoreBase() {
    SharedPreferences.getInstance().then((prefs) async {
      if (prefs.containsKey(userKey)) {
        Map<String, dynamic>? userData = jsonDecode(prefs.getString(userKey)!);
        if (userData != null) {
          user = UserModel.fromJson(userData);
          isUserAuthenticated = true;
        }
      }
    });
  }

  @observable
  UserModel? user;

  @observable
  bool isUserAuthenticated = false;

  @observable
  bool isLoading = false;

  @action
  void toggleLoading() {
    isLoading = !isLoading;
  }


  @action
  Future<void> saveUser(UserModel? newUser) async {
    user = newUser;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (newUser != null) {
      prefs.setString(userKey, jsonEncode(newUser.toJson()));
      isUserAuthenticated = true;
    } else {
      prefs.remove(userKey);
      isUserAuthenticated = false;
    }
  }

  @action
  Future<void> logoutUser()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey(userKey)){
      prefs.remove(userKey);
    }


    isLoading = true;
    isUserAuthenticated = false;
    user = null;
    isLoading = false;
  }
}
