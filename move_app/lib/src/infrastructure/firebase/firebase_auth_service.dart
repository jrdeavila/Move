import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IAuthenticationService)
class FirebaseAuthService implements IAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final IUserRepository _userRepository;

  FirebaseAuthService(
      {required FirebaseAuth firebaseAuth,
      required IUserRepository userRepository})
      : _firebaseAuth = firebaseAuth,
        _userRepository = userRepository;
  @override
  Future<AppUser> getUser() {
    final user = _firebaseAuth.currentUser;
    return _userRepository.getUser(user!.uid);
  }

  @override
  Future<AppUser> login(String email, String password) {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((credential) => _userRepository.getUser(credential.user!.uid));
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  @override
  Future<AppUser> register(String name, String email, String password,
      String confirmPassword) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user =
        AppUser(uid: credential.user!.uid, email: email, name: name, roles: [
      AppUserRole.client,
    ]);
    return _userRepository.createUser(user);
  }

  @override
  Stream<bool> isAuthenticated() {
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }
}
