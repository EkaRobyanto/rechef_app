import 'package:rechef_app/src/features/account/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<dynamic> getFavorite(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value([]);
  }

  @override
  Future getAccount(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value('');
  }
}
