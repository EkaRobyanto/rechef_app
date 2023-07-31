import 'package:dio/dio.dart';
import 'package:rechef_app/src/features/account/repository/user_repository.dart';

import '../../../core/api/services.dart';

class UserRepositoryImpl extends UserRepository {
  final api = APIService();
  final client = Dio();

  @override
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

  @override
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
