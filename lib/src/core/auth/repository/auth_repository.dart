import 'package:rechef_app/src/features/auth/domain/user_regist.dart';

abstract class AuthRepositoryInterface {
  Future<void> login(Map<String, dynamic> data);
  Future<void> register(UserRegist data);
  Future<bool> checkAuthentication();
  Future<void> signOut();
}
