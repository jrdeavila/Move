abstract class IAuthenticationService {
  Future<void> logout();

  Stream<bool> isAuthenticated();

  String getUserUuid();
  String getUserPhone();
  String getUserEmail();
}

abstract interface class ILoginWithGoogleService {
  Future<void> loginWithGoogle();
}
