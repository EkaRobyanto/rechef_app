class AuthRepository {
  Future<void> register() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
