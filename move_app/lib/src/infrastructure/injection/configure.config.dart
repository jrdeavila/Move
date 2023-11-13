// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_app_check/firebase_app_check.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../lib.dart' as _i7;
import '../../application/use_cases/authentication_use_case.dart' as _i10;
import '../firebase/repositories/firebase_user_repository.dart' as _i8;
import '../firebase/services/firebase_auth_service.dart' as _i9;
import 'dependecies.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseAppModule = _$FirebaseAppModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i4.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i5.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    gh.lazySingleton<_i6.FirebaseFirestore>(() => firestoreModule.firestore);
    gh.factory<_i7.IUserRepository>(() =>
        _i8.FirebaseUserRepository(firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i7.IAuthenticationService>(() => _i9.FirebaseAuthService(
          firebaseAuth: gh<_i5.FirebaseAuth>(),
          userRepository: gh<_i7.IUserRepository>(),
        ));
    gh.factory<_i7.IGetUserUseCase>(
        () => _i10.GetUserUseCase(gh<_i7.IAuthenticationService>()));
    gh.factory<_i7.ILogoutUseCase>(
        () => _i10.LogoutUseCase(gh<_i7.IAuthenticationService>()));
    gh.singleton<_i7.IPhoneAuthenticationService>(
        _i9.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i5.FirebaseAuth>(),
      userRepository: gh<_i7.IUserRepository>(),
    ));
    gh.factory<_i7.IRegisterUseCase>(
        () => _i10.RegisterUseCase(gh<_i7.IAuthenticationService>()));
    gh.factory<_i7.ISendCodeUseCase>(
        () => _i10.SendCodeUseCase(gh<_i7.IPhoneAuthenticationService>()));
    gh.factory<_i7.ILoginWithPhoneUseCase>(() =>
        _i10.LoginWithPhoneUseCase(gh<_i7.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i11.FirebaseAppModule {}

class _$AppCheckModule extends _i11.AppCheckModule {}

class _$FirebaseAuthModule extends _i11.FirebaseAuthModule {}

class _$FirestoreModule extends _i11.FirestoreModule {}
