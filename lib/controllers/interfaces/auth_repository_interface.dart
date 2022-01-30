import 'package:blog_snake/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel?> login(String email, String password) async {
    // TODO: Request the api to authenticate a user
    throw UnimplementedError();
  }

  Future<UserModel>? register(Map<String,dynamic> data) {
    //TODO: Request the api to register a new user
    throw UnimplementedError();
  }
}
