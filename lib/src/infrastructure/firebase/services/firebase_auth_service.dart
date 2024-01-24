import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IAuthenticationService)
class FirebaseAuthService implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  Stream<bool> isAuthenticated() {
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  @override
  String getUserPhone() {
    return _firebaseAuth.currentUser!.phoneNumber ?? "";
  }

  @override
  String getUserUuid() {
    return _firebaseAuth.currentUser!.uid;
  }

  @override
  String getUserEmail() {
    return _firebaseAuth.currentUser!.email!;
  }
}

@Singleton(as: ILoginWithGoogleService)
class LoginWithGoogleService implements ILoginWithGoogleService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  LoginWithGoogleService({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<void> loginWithGoogle() async {
    final isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      await _googleSignIn.signOut();
    }
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }
}
