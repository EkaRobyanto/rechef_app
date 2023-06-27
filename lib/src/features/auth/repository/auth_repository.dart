abstract class AuthRepositoryInterface {
  Future<void> login(Map<String, dynamic> data);
  Future<void> register(Map<String, dynamic> data);
}
