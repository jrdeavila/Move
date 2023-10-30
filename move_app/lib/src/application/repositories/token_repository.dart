abstract class TokenRepository {
  Future<void> persistToken(String token);

  Future<void> deleteToken();

  Future<bool> hasToken();

  Future<String?> getToken();
}
