import 'package:blog_snake/controllers/services/api_client.dart';

class UserProvider {
  final APIClient _client = APIClient();

  Future login(String email, String password) async {
    const String url = '/account/login';
    final data = await _client.post(
      url,
      body: {'email': email, 'password': password},
    );
    print(data);
  }
}
