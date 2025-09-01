class LoginResponseModel {
  final String username;
  final String token;

  LoginResponseModel({required this.username, required this.token});
  //from json
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(username: json['username'], token: json['token']);
  }
}
