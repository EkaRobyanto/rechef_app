import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future<SharedPreferences> accessStorage() async {
    return await SharedPreferences.getInstance();
  }

  Future<Map<String, String?>> getTokens() async {
    String? token, refreshToken;
    await accessStorage().then((value) {
      token = value.getString('token');
      refreshToken = value.getString('refreshToken');
    });
    return {
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  Future updateToken(Map<String, dynamic> data) async {
    await accessStorage().then((value) {
      value.setString('token', data['access']);
      value.setString('refreshToken', data['refresh']);
    });
    log('token updated');
  }
}
