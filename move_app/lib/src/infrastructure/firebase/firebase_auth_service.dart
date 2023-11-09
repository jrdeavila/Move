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

@Injectable(as: IPhoneAuthenticationService)
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
  Future<void> loginWithPhone({
    required String phone,
    required void Function() onCodeSend,
    required void Function(AppUser) onVerificationComplete,
    required void Function() onError,
    required void Function(String) onCodeRetrival,
    int? resendToken,
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      codeSent: (verificationId, forceResendingToken) {
        return;
      },
      phoneNumber: phone,
      forceResendingToken: resendToken,
      verificationCompleted: (phoneAuthCredential) async {
        final credentials =
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        final user = await _userRepository.getUser(credentials.user!.uid);

        onVerificationComplete(user);
      },
      verificationFailed: (error) => onError(),
      codeAutoRetrievalTimeout: onCodeRetrival,
    );
  }
}
