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
import '../../application/use_cases/authentication_use_case.dart' as _i11;
import '../../application/use_cases/driver_request_use_cases.dart' as _i16;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i14;
import '../../application/use_cases/find_file_use_cases.dart' as _i10;
import '../../application/use_cases/profile_use_case.dart' as _i17;
import '../../src.dart' as _i15;
import '../device/services/find_file.dart' as _i9;
import '../firebase/repositories/firebase_user_repository.dart' as _i13;
import '../firebase/services/firebase_auth_service.dart' as _i8;
import '../firebase/services/firebase_driver_request_service.dart' as _i7;
import '../firebase/services/firebase_upload_file_service.dart' as _i12;
import 'dependecies.dart' as _i18;

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
    gh.factory<_i6.IFileSearchService>(() => _i9.FindFileService());
    gh.factory<_i6.IFindFileUseCase>(
        () => _i10.FindFileUseCase(gh<_i6.IFileSearchService>()));
    gh.factory<_i6.ISendDriverRequestService>(() =>
        _i7.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IGetDriverRequestService>(() =>
        _i7.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ILogoutUseCase>(
        () => _i11.LogoutUseCase(gh<_i6.IAuthenticationService>()));
    gh.factory<_i6.INoCriminalRecordSectionService>(() =>
        _i7.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IOwnerShipCardSectionService>(() =>
        _i7.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ISoatSectionService>(() => _i7.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.ITechnicalReviewSectionService>(() =>
        _i7.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IUploadFile>(() => _i12.FirebaseUploadFileService(
        firebaseStorage: gh<_i6.FirebaseStorage>()));
    gh.factory<_i6.IUserRepository>(() =>
        _i13.FirebaseUserRepository(firestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i6.IFetchDriverRequestUseCase>(() =>
        _i14.FetchDriverRequestUseCase(
            driverRequestService: gh<_i6.IGetDriverRequestService>()));
    gh.factory<_i15.ISendDriverRequestUseCase>(
        () => _i16.SendDriverRequestUseCase(
              driverRequestService: gh<_i15.ISendDriverRequestService>(),
              userService: gh<_i15.IUserRepository>(),
            ));
    gh.factory<_i6.IGetUserUseCase>(() => _i11.GetUserUseCase(
          authenticationService: gh<_i6.IAuthenticationService>(),
          userRepository: gh<_i6.IUserRepository>(),
        ));
    gh.singleton<_i6.IPhoneAuthenticationService>(
        _i8.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i5.FirebaseAuth>(),
      userRepository: gh<_i6.IUserRepository>(),
    ));
    gh.factory<_i6.IRegisterUseCase>(() => _i11.RegisterUseCase(
          userRepository: gh<_i6.IUserRepository>(),
          authenticationService: gh<_i6.IAuthenticationService>(),
        ));
    gh.factory<_i15.ISendAboutCarSectionUseCase>(
        () => _i16.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i15.IAboutCarSectionService>(),
              userService: gh<_i15.IUserRepository>(),
              uploadFile: gh<_i15.IUploadFile>(),
            ));
    gh.factory<_i15.ISendAboutMeSectionUseCase>(
        () => _i16.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i15.IAboutMeSectionService>(),
              userService: gh<_i15.IUserRepository>(),
              uploadFile: gh<_i15.IUploadFile>(),
            ));
    gh.factory<_i6.ISendCodeUseCase>(
        () => _i11.SendCodeUseCase(gh<_i6.IPhoneAuthenticationService>()));
    gh.factory<_i15.ISendDNISectionUseCase>(() => _i16.SendDNISectionUseCase(
          dniSectionService: gh<_i15.IDNISectionService>(),
          userService: gh<_i15.IUserRepository>(),
          uploadFile: gh<_i15.IUploadFile>(),
        ));
    gh.factory<_i15.ISendDriverLicenseSectionUseCase>(() =>
        _i16.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i15.IDriverLicenseSectionService>(),
          userService: gh<_i15.IUserRepository>(),
          uploadFile: gh<_i15.IUploadFile>(),
        ));
    gh.factory<_i15.ISendNoCriminalRecordSectionUseCase>(
        () => _i16.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i15.INoCriminalRecordSectionService>(),
              userService: gh<_i15.IUserRepository>(),
              uploadFile: gh<_i15.IUploadFile>(),
            ));
    gh.factory<_i15.ISendOwnerShipCardSectionUseCase>(() =>
        _i16.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i15.IOwnerShipCardSectionService>(),
          userService: gh<_i15.IUserRepository>(),
          uploadFile: gh<_i15.IUploadFile>(),
        ));
    gh.factory<_i15.ISendSoatSectionUseCase>(() => _i16.SendSoatSectionUseCase(
          soatSectionService: gh<_i15.ISoatSectionService>(),
          userService: gh<_i15.IUserRepository>(),
          uploadFile: gh<_i15.IUploadFile>(),
        ));
    gh.factory<_i15.ISendTechnicalReviewSectionUseCase>(
        () => _i16.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i15.ITechnicalReviewSectionService>(),
              userService: gh<_i15.IUserRepository>(),
              uploadFile: gh<_i15.IUploadFile>(),
            ));
    gh.factory<_i6.IUpdateProfileUseCase>(() =>
        _i17.UpdateProfileUseCase(userRepository: gh<_i6.IUserRepository>()));
    gh.factory<_i6.ILoginWithPhoneUseCase>(() =>
        _i11.LoginWithPhoneUseCase(gh<_i6.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i18.FirebaseAppModule {}

class _$AppCheckModule extends _i18.AppCheckModule {}

class _$FirebaseAuthModule extends _i18.FirebaseAuthModule {}

class _$FirestoreModule extends _i18.FirestoreModule {}

class _$FirebaseStorageModule extends _i18.FirebaseStorageModule {}
