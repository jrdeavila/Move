// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_app_check/firebase_app_check.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../lib.dart' as _i6;
import '../../application/use_cases/authentication_use_case.dart' as _i9;
import '../../application/use_cases/driver_request_use_cases.dart' as _i14;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i12;
import '../../application/use_cases/profile_use_case.dart' as _i15;
import '../../src.dart' as _i13;
import '../firebase/repositories/firebase_user_repository.dart' as _i11;
import '../firebase/services/firebase_auth_service.dart' as _i8;
import '../firebase/services/firebase_driver_request_service.dart' as _i7;
import '../firebase/services/firebase_upload_file_service.dart' as _i10;
import 'dependecies.dart' as _i16;

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
    final firebaseStorageModule = _$FirebaseStorageModule();
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
    await gh.lazySingletonAsync<_i6.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    gh.factory<_i6.IAboutCarSectionService>(() =>
        _i7.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IAboutMeSectionService>(() =>
        _i7.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IAuthenticationService>(
        () => _i8.FirebaseAuthService(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i6.IDNISectionService>(() => _i7.FirebaseDNISectionService(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IDriverLicenseSectionService>(() =>
        _i7.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IFinishDriverRequestService>(() =>
        _i7.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IGetDriverRequestService>(() =>
        _i7.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ILogoutUseCase>(
        () => _i9.LogoutUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.INoCriminalRecordSectionService>(() =>
        _i7.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IUploadFile>(() => _i10.FirebaseUploadFileService(
        firebaseStorage: gh<_i6.FirebaseStorage>()));
    gh.factory<_i6.IUserRepository>(() =>
        _i11.FirebaseUserRepository(firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IFetchDriverRequestUseCase>(() =>
        _i12.FetchDriverRequestUseCase(
            driverRequestService: gh<_i6.IGetDriverRequestService>()));
    gh.factory<_i13.IFinishDriverRequestUseCase>(
        () => _i14.FinishDriverRequestUseCase(
              driverRequestService: gh<_i13.IFinishDriverRequestService>(),
              userService: gh<_i13.IUserRepository>(),
            ));
    gh.factory<_i6.IGetUserUseCase>(() => _i9.GetUserUseCase(
          authenticationService: gh<_i6.IAuthenticationService>(),
          userRepository: gh<_i6.IUserRepository>(),
        ));
    gh.singleton<_i6.IPhoneAuthenticationService>(
        _i8.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i5.FirebaseAuth>(),
      userRepository: gh<_i6.IUserRepository>(),
    ));
    gh.factory<_i6.IRegisterUseCase>(() => _i9.RegisterUseCase(
          userRepository: gh<_i6.IUserRepository>(),
          authenticationService: gh<_i6.IAuthenticationService>(),
        ));
    gh.factory<_i13.ISendAboutCarSectionUseCase>(
        () => _i14.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i13.IAboutCarSectionService>(),
              userService: gh<_i13.IUserRepository>(),
              uploadFile: gh<_i13.IUploadFile>(),
            ));
    gh.factory<_i13.ISendAboutMeSectionUseCase>(
        () => _i14.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i13.IAboutMeSectionService>(),
              userService: gh<_i13.IUserRepository>(),
              uploadFile: gh<_i13.IUploadFile>(),
            ));
    gh.factory<_i6.ISendCodeUseCase>(
        () => _i9.SendCodeUseCase(gh<_i6.IPhoneAuthenticationService>()));
    gh.factory<_i13.ISendDNISectionUseCase>(() => _i14.SendDNISectionUseCase(
          dniSectionService: gh<_i13.IDNISectionService>(),
          userService: gh<_i13.IUserRepository>(),
          uploadFile: gh<_i13.IUploadFile>(),
        ));
    gh.factory<_i13.ISendDriverLicenseSectionUseCase>(() =>
        _i14.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i13.IDriverLicenseSectionService>(),
          userService: gh<_i13.IUserRepository>(),
          uploadFile: gh<_i13.IUploadFile>(),
        ));
    gh.factory<_i13.ISendNoCriminalRecordSectionUseCase>(
        () => _i14.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i13.INoCriminalRecordSectionService>(),
              userService: gh<_i13.IUserRepository>(),
              uploadFile: gh<_i13.IUploadFile>(),
            ));
    gh.factory<_i6.IUpdateProfileUseCase>(() =>
        _i15.UpdateProfileUseCase(userRepository: gh<_i6.IUserRepository>()));
    gh.factory<_i6.ILoginWithPhoneUseCase>(
        () => _i9.LoginWithPhoneUseCase(gh<_i6.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i16.FirebaseAppModule {}

class _$AppCheckModule extends _i16.AppCheckModule {}

class _$FirebaseAuthModule extends _i16.FirebaseAuthModule {}

class _$FirestoreModule extends _i16.FirestoreModule {}

class _$FirebaseStorageModule extends _i16.FirebaseStorageModule {}
