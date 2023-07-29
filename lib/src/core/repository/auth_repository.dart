import 'package:rechef_app/src/features/auth/domain/user_regist.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepositoryInterface {
  Future<void> login(Map<String, dynamic> data);
  Future<void> register(UserRegist data);
  Future<bool> checkAuthentication(SharedPreferences storage);
  Future<void> signOut(SharedPreferences storage);
}
