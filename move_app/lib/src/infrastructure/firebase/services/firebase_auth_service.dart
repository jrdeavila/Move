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

@Singleton(as: IPhoneAuthenticationService)
class FirebasePhoneAuthenticationService
    implements IPhoneAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final IUserRepository _userRepository;

  late String _verificationId;
  int? _resendToken;

  FirebasePhoneAuthenticationService({
    required FirebaseAuth firebaseAuth,
    required IUserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth,
        _userRepository = userRepository;

  @override
  Future<void> loginWithPhone({
    required String phone,
    required void Function() onCodeSend,
    Duration timeout = const Duration(seconds: 60),
  }) {
    return _firebaseAuth.verifyPhoneNumber(
      codeSent: (verificationId, forceResendingToken) {
        _resendToken = forceResendingToken;
        _verificationId = verificationId;
        onCodeSend();
      },
      phoneNumber: phone,
      forceResendingToken: _resendToken,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) => throw error,
      codeAutoRetrievalTimeout: (code) {},
      timeout: timeout,
    );
  }

  @override
  Future<void> verifyCode({
    required String smsCode,
    required void Function() onLoginSuccess,
    required void Function() onShouldRegister,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);

    final existInfo =
        await _userRepository.isUserExists(userCredential.user!.uid);
    if (existInfo) {
      return onLoginSuccess();
    } else {
      return onShouldRegister();
    }
  }
}
