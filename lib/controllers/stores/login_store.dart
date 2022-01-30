import 'package:blog_snake/controllers/repositories/auth_repository.dart';
import 'package:blog_snake/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AuthRepository _authRepository = AuthRepository();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  Future<UserModel?> login() async {
    isLoading = true;

    UserModel? user = await _authRepository.login(
        emailController.text, passwordController.text);

    // await Future.delayed(const Duration(seconds: 2));

    isLoading = false;

    return user;
  }
}
