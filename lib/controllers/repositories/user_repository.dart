import 'package:blog_snake/controllers/interfaces/user_repository_interface.dart';
import 'package:blog_snake/models/user_model.dart';

class UserRepository implements IUserRepository {
  @override
  Future<UserModel> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<UserModel> register(UserModel newUser) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
