class UserModel {
  late final String token;
  late final String username;
  late final String email;
  late final String firstName;

  UserModel({
    required this.token,
    required this.username,
    required this.email,
    required this.firstName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        token: json['token'],
        username: json['username'],
        email: json['email'],
        firstName: json['first_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['username'] = username;
    _data['email'] = email;
    _data['first_name'] = firstName;
    return _data;
  }
}
