import 'package:dio/dio.dart';

import '../../../core/api/services.dart';

class UserRepositoryImpl {
  final api = APIService();
  final client = Dio();

  Future<dynamic> getFavorite(String token) async {
    try {
      return await api.call(
        request: () async {
          return await client.getUri(
            api.favoriteRecipe(),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAccountRecipe(String token) async {
    try {
      return await api.call(
        request: () async {
          return await client.getUri(
            api.userRecipe(),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future getAccount(String token) async {
    try {
      return await api.call(
        request: () async {
          return await client.getUri(
            api.profileUrl(),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }
}
