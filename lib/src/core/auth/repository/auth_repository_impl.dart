import 'package:rechef_app/src/features/auth/domain/user_regist.dart';
import 'package:rechef_app/src/core/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  String token = '1';

  @override
  Future<void> register(UserRegist data) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<void> login(Map<String, dynamic> data) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<bool> checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 2));
    if (token == '') {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> signOut() async {
    try {} catch (e) {}
  }
}
