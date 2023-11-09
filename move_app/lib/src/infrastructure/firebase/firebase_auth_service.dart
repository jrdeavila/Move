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
  Stream<bool> isAuthenticated() {
    return _firebaseAuth.authStateChanges().map((user) => user != null);
  }

  @override
  Future<AppUser> register(AppUser appUser, {required String password}) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(
      email: appUser.email,
      password: password,
    )
        .then((credential) {
      appUser.uuid = credential.user!.uid;
      return _userRepository.createUser(appUser);
    });
  }
}

class FirebasePhoneAuthenticationService
    implements IPhoneAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final IUserRepository _userRepository;

  FirebasePhoneAuthenticationService({
    required FirebaseAuth firebaseAuth,
    required IUserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth,
        _userRepository = userRepository;

  @override
  Future<Future<AppUser> Function(String verficationCode)> loginWithPhone(
      String phone) async {
    final confirmation = await _firebaseAuth.signInWithPhoneNumber(phone);
    return (String verificationCode) async {
      final credential = PhoneAuthProvider.credential(
        verificationId: confirmation.verificationId,
        smsCode: verificationCode,
      );
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      return _userRepository.getUser(user!.uid);
    };
  }
}
