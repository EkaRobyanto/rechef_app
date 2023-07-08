abstract class UserRepository {
  Future<dynamic> getAccount(String token);
  Future<dynamic> getFavorite(String token);
}
