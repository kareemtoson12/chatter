class RegisterRequest {
  final String username;
  final String password;
  final String title;
  final String bio;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.title,
    required this.bio,
  });

  // Convert to JSON for API request
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'title': title,
      'bio': bio,
    };
  }
}
