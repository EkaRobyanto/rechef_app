import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future<SharedPreferences> accessStorage() async {
    return await SharedPreferences.getInstance();
  }

  Future<Map<String, String?>> getTokens() async {
    String? token, refreshToken;
    await accessStorage().then((value) {
      token = value.getString('access');
      refreshToken = value.getString('refresh');
    });
    return {
      'access': token,
      'refresh': refreshToken,
    };
  }

  Future updateToken(Map<String, dynamic> data) async {
    await accessStorage().then((value) {
      value.setString('access', data['access']);
      value.setString('refresh', data['refresh']);
    });
    log('token updated');
  }
}
