import 'package:blog_snake/controllers/repositories/auth_repository.dart';
import 'package:blog_snake/models/user_model.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  final AuthRepository _authRepository = AuthRepository();



  @observable
  bool isLoading = false;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController firstNameController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController cpfController = TextEditingController();

  @observable
  TextEditingController usernameController = TextEditingController();

  @observable
  TextEditingController passwordController1 = TextEditingController();

  @observable
  TextEditingController passwordController2 = TextEditingController();

  @computed
  bool get isPasswordsIdentical =>
      passwordController1.text == passwordController2.text;

  String? firstNameValidator(String? firstName) {
    if (firstName!.isEmpty) {
      return 'Fill this field!';
    }
  }

  String? usernameValidator(String? firstName) {
    if (firstName!.isEmpty) {
      return 'Fill this field!';
    }
  }

  String? cpfValidator(String? cpf) {
    if (cpf!.isEmpty) {
      return 'Fill this field!';
    } else if (!CPFValidator.isValid(cpf)) {
      return 'Your CPF is invalid!';
    }
  }

  String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return 'Fill this field!';
    } else if (!EmailValidator.validate(email)) {
      return 'Your e-mail is invalid!';
    }
  }

  String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Fill this field!';
    } else if (password.length < 8) {
      return 'Your password is too short. Eight characters its the minimum';
    } else if (!isPasswordsIdentical) {
      return 'The passwords entered are not the same';
    }
  }

  @action
  Future<UserModel?> register() async {
    isLoading =true;

    Map<String, dynamic> data = {
      "first_name": firstNameController.text,
      "email": emailController.text,
      "username": usernameController.text,
      "password": passwordController1.text,
      "password2": passwordController2.text,
    };

    var user = await _authRepository.register(data);
    isLoading =false;

    return user;
  }
}
