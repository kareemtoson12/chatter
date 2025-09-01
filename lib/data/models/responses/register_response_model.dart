class RegisterResponseModel {
  final String username;
  final String token;

  RegisterResponseModel({required this.username, required this.token});
  //from json
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      username: json['username'],
      token: json['token'],
    );
  }
}
