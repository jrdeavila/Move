// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../lib.dart' as _i6;
import '../../application/use_cases/authentication_use_case.dart' as _i9;
import '../firebase/firebase_auth_service.dart' as _i8;
import '../firebase/repositories/firebase_user_repository.dart' as _i7;
import 'dependecies.dart' as _i10;

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
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i4.FirebaseAuth>(() => firebaseAuthModule.firebaseAuth);
    gh.lazySingleton<_i5.FirebaseFirestore>(() => firestoreModule.firestore);
    gh.factory<_i6.IUserRepository>(() =>
        _i7.FirebaseUserRepository(firestore: gh<_i5.FirebaseFirestore>()));
    gh.factory<_i6.IAuthenticationService>(() => _i8.FirebaseAuthService(
          firebaseAuth: gh<_i4.FirebaseAuth>(),
          userRepository: gh<_i6.IUserRepository>(),
        ));
    gh.factory<_i6.IGetUserUseCase>(
        () => _i9.GetUserUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.ILoginUseCase>(
        () => _i9.LoginUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.ILogoutUseCase>(
        () => _i9.LogoutUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.IRegisterUseCase>(
        () => _i9.RegisterUseCase(gh<_i6.IAuthenticationService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i10.FirebaseAppModule {}

class _$FirebaseAuthModule extends _i10.FirebaseAuthModule {}

class _$FirestoreModule extends _i10.FirestoreModule {}
