class AuthException implements Exception {
  final String message = "Login or password wrong";

  @override
  String toString() {
    return message;
  }
}
