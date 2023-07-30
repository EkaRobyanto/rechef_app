import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/api/services.dart';
import '../../recipe/domain/recipe/recipe.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final api = APIService();
  final client = Dio();

  @override
  Future getHomeData(String token) async {
    try {
      return await api.call(request: () async {
        return await client.getUri(
          api.listRecipe(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
      }, parse: (data) {
        return data['results'].map((recipe) {
          return Recipe.fromJson(recipe);
        }).toList();
      });
    } catch (e) {
      throw (e.toString());
    }
  }
}
