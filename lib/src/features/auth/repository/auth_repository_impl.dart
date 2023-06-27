import 'package:rechef_app/src/features/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepositoryInterface {
  @override
  Future<void> register(Map<String, dynamic> data) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> login(Map<String, dynamic> data) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
