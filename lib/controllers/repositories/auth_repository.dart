import 'package:blog_snake/controllers/interfaces/auth_repository_interface.dart';
import 'package:blog_snake/controllers/services/api_client.dart';
import 'package:blog_snake/models/user_model.dart';

class AuthRepository implements IAuthRepository {
  final APIClient _apiClient = APIClient();

  @override
  Future<UserModel?> login(String email, String password) async {
    const String url = '/account/login';

    var data = await _apiClient
        .post(url, body: {'email': email, 'password': password});

    // print(data);

    if (data != null) {
      // print(data);
      return UserModel.fromJson(data['data']['user']);
    }
    return null;
  }

  @override
  Future<UserModel>? register(Map<String, dynamic> data) async {
    String url = '/account/register';

    var response = await _apiClient.post(url, body: data);
    // print(response);
    return UserModel.fromJson(response['data']);
  }
}
