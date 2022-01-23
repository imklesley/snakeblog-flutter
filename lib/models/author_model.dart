class AuthorModel {
  AuthorModel({
    required this.username,
    required this.email,
    required this.firstName,
  });
  late final String username;
  late final String email;
  late final String firstName;

  AuthorModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['first_name'] = firstName;
    return _data;
  }
}