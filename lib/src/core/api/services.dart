import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rechef_app/src/shared/exceptions/network_exception.dart';

import '../../shared/exceptions/token_exception.dart';
import '../../utills/check_connection.dart';

class APIService {
  static const String _apiBaseUrl = "recheffapp.pythonanywhere.com";

  Uri _buildUri({
    required String endpoints,
    Map<String, dynamic>? params,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: endpoints,
      queryParameters: params,
    );
  }

  Future<void> justCall(Future<Response> Function() request) async {
    try {
      await checkConnection();
      await request().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw NetworkException('Connection Timeout');
        },
      );
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Call Error=====');
      // log('${res?.data}');
      log(res?.statusCode.toString() ?? 'Unknown Error');
      if (res?.data['detail'] == 'Given token not valid for any token type') {
        throw TokenException('Token Expired');
      }
      if (res != null) {
        log(res.data.toString());
        throw res.data;
      } else {
        throw 'Unknown Error';
      }
    }
  }

  Future<T> call<T>(
      {required Future<Response> Function() request, required parse}) async {
    try {
      await checkConnection();
      final response = await request().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw NetworkException('Connection Timeout');
        },
      );
      // debugPrint(response.data);
      return parse(response.data);
    } on DioException catch (e) {
      Response? res = e.response;
      log('=====Call Error=====');
      log(res?.statusCode.toString() ?? 'Unknown Error');
      if (res?.data['detail'] == 'Given token not valid for any token type') {
        throw TokenException('Token Expired');
      }
      if (res != null) {
        log(res.data.toString());
        throw res.data;
      } else {
        throw 'Unknown Error';
      }
    }
  }

  Uri registerUrl() => _buildUri(endpoints: '/auth/register/');
  Uri loginUrl() => _buildUri(endpoints: '/auth/login/');
  Uri profileUrl() => _buildUri(endpoints: '/auth/profile/');
  Uri listRecipe([String? query]) =>
      _buildUri(endpoints: '/api/recipe/', params: {
        if (query != null) 'search': query,
      }); // add recipe

  Uri detailRecipe(String id) =>
      _buildUri(endpoints: '/api/recipe/$id'); //edit recipe delete recipe
  Uri favoriteRecipe() => _buildUri(endpoints: '/api/favorite/');
  Uri category() => _buildUri(endpoints: '/api/ingredient-category/');
  Uri ingredientByCategory(String category) =>
      _buildUri(endpoints: '/api/ingredient-category/$category');
}
