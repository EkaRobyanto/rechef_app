import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rechef_app/src/core/api/services.dart';
import 'package:rechef_app/src/features/auth/domain/user_regist.dart';
import 'package:rechef_app/src/core/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  final api = APIService();
  final client = Dio();

  @override
  Future register(UserRegist data) async {
    try {
      return await api.call(
        request: () async {
          // FormData form = FormData.fromMap();
          return await client.postUri(
            api.registerUrl(),
            data: {
              'username': data.username,
              'email': data.email,
              'gender': data.gender,
              'interest': [...data.interest],
              'password': data.password,
              'password_2': data.confirmPassword,
            },
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future login(Map<String, dynamic> data) async {
    try {
      return await api.call(
        request: () async {
          return await client.postUri(
            api.loginUrl(),
            data: {
              'email': data['email'],
              'password': data['password'],
            },
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<bool> checkAuthentication(SharedPreferences storage) async {
    String? token = storage.getString('access');
    debugPrint(token);
    if (token != null) {
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut(SharedPreferences storage) => storage.clear();
}
