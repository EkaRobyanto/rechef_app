import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<String> getHomeData(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    return '';
  }
}
