import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';
import 'package:recipe_app/features/home_page/data/models/home_chef_model.dart';

import '../../../profile/data/models/user_model.dart';
import '../models/sign_up_user_model.dart';

class UserRepository {
  final ApiClient client;

  UserRepository({required this.client});

  Future<bool> signUp({
    required String name,
    required String surname,
    required String username,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.signUp(
        user: SignUpUserModel(
      password: password,
      email: email,
      username: username,
      name: name,
      surname: surname,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
    ));
    if (result["result"]) {
      SecureStorage.deleteToken();
      SecureStorage.saveToken(token: result["token"]);
      SecureStorage.deleteCredentials();
      SecureStorage.saveCredentials(login: phoneNumber, password: password);
      return true;
    } else {
      return false;
    }
  }

  UserModel? chefProfile;
  UserModel? meProfile;
  List<HomeChefModel> homeChefs=[];

  Future<UserModel> fetchChefProfileById(int userId) async {
    var rawUser = await client.fetchChefProfileById(userId);
    chefProfile = UserModel.fromJson(rawUser);
    return chefProfile!;
  }


  Future<List<HomeChefModel>> fetchHomeChefs([int? limit])async {
    var chefData=await client.fetchHomeChefs(limit);
    homeChefs=chefData.map((e)=>HomeChefModel.fromJson(e)).toList();
    return homeChefs;
  }
  Future<UserModel> fetchMyProfile() async {
    if (meProfile != null) return meProfile!;
    var rawUser = await client.fetchMyProfile();
    meProfile = UserModel.fromJson(rawUser);
    return meProfile!;
  }

  Future<void> login({required String login, required String password}) async {
    final String token = await client.login(login: login, password: password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token: token);
  }

  Future logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials!['login'] == null || credentials["password"] == null) {
      return false;
    } else {
      var jwt = await client.login(
          login: credentials['login']!, password: credentials["password"]!);
      await SecureStorage.deleteToken();
      await SecureStorage.saveToken(token: jwt);
      return true;
    }
  }
}
