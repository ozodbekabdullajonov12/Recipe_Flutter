import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final String _passwordKey = "password";
  static final String _loginKey = "login";

  static final String _tokenKey = "token";

  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveCredentials(
      {required String login, required String password}) async {
    await _storage.write(key: _loginKey, value: login);
    await _storage.write(key: _passwordKey, value: password);
  }

  static Future<void> deleteCredentials() async {
    await _storage.delete(key: _loginKey);
    await _storage.delete(key: _passwordKey);
  }

  static Future<Map<String, String>?> getCredentials() async {
    final String? login = await _storage.read(key: _loginKey);
    final String? password = await _storage.read(key: _passwordKey);

    if (login == null || password == null) return null;

    return {_loginKey: login, _passwordKey: password};
  }

static  Future<void> saveToken({required String token}) async {
    await _storage.write(key: _tokenKey, value: token);
  }

 static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

 static Future<String?> getToken() async {
    final String? token = await _storage.read(key: _tokenKey);
    if (token == null) return null;
    return token;
  }
}
