// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_app_check/firebase_app_check.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../lib.dart' as _i7;
import '../../application/use_cases/authentication_use_case.dart' as _i15;
import '../../application/use_cases/driver_request_use_cases.dart' as _i21;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i19;
import '../../application/use_cases/find_address_use_cases.dart' as _i13;
import '../../application/use_cases/find_file_use_cases.dart' as _i11;
import '../../application/use_cases/profile_use_case.dart' as _i23;
import '../../application/use_cases/request_service_use_case.dart' as _i22;
import '../../src.dart' as _i20;
import '../cache/services/find_known_address_service.dart' as _i14;
import '../device/services/find_file.dart' as _i10;
import '../firebase/repositories/firebase_payment_repository.dart' as _i16;
import '../firebase/repositories/firebase_user_repository.dart' as _i18;
import '../firebase/services/firebase_auth_service.dart' as _i9;
import '../firebase/services/firebase_driver_request_service.dart' as _i8;
import '../firebase/services/firebase_upload_file_service.dart' as _i17;
import '../google/services/google_find_address_service.dart' as _i12;
import 'dependecies.dart' as _i24;

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
    final dioModule = _$DioModule();
    final firebaseAppModule = _$FirebaseAppModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.dio);
    await gh.factoryAsync<_i4.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i5.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i7.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i7.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    gh.factory<_i7.IAboutCarSectionService>(() =>
        _i8.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IAboutMeSectionService>(() =>
        _i8.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IAuthenticationService>(
        () => _i9.FirebaseAuthService(firebaseAuth: gh<_i6.FirebaseAuth>()));
    gh.factory<_i7.IDNISectionService>(() => _i8.FirebaseDNISectionService(
        firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IDriverLicenseSectionService>(() =>
        _i8.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IFileSearchService>(() => _i10.FindFileService());
    gh.factory<_i7.IFindFileUseCase>(
        () => _i11.FindFileUseCase(gh<_i7.IFileSearchService>()));
    gh.factory<_i7.IFinishDriverRequestService>(() =>
        _i8.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IGetAddressByGeopointService>(
        () => _i12.GoogleGetAddressByGeopointService(gh<_i3.Dio>()));
    gh.factory<_i7.IGetAddressByGeopointUseCase>(() =>
        _i13.GetMyAddressByGeopointUseCase(
            gh<_i7.IGetAddressByGeopointService>()));
    gh.factory<_i7.IGetAddressByQueryService>(
        () => _i12.GoogleFindAddressService(gh<_i3.Dio>()));
    gh.factory<_i7.IGetAddressesByQueryUseCase>(() =>
        _i13.GetAddressesByQueryUseCase(gh<_i7.IGetAddressByQueryService>()));
    gh.factory<_i7.IGetDriverRequestService>(() =>
        _i8.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IGetKnownAddressesService>(
        () => _i14.CacheGetKnownAddressesService());
    gh.factory<_i7.IGetKnownAddressesUseCase>(() =>
        _i13.GetKnownAddressesUseCase(gh<_i7.IGetKnownAddressesService>()));
    gh.factory<_i7.ILogoutUseCase>(
        () => _i15.LogoutUseCase(gh<_i7.IAuthenticationService>()));
    gh.factory<_i7.INoCriminalRecordSectionService>(() =>
        _i8.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IOwnerShipCardSectionService>(() =>
        _i8.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IPaymentRepository>(
        () => _i16.FirebasePaymentRepository(gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.ISendDriverRequestService>(() =>
        _i8.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.ISoatSectionService>(() => _i8.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.ITechnicalReviewSectionService>(() =>
        _i8.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IUploadFile>(() => _i17.FirebaseUploadFileService(
        firebaseStorage: gh<_i7.FirebaseStorage>()));
    gh.factory<_i7.IUserRepository>(() =>
        _i18.FirebaseUserRepository(firestore: gh<_i7.FirebaseFirestore>()));
    gh.factory<_i7.IFetchDriverRequestUseCase>(() =>
        _i19.FetchDriverRequestUseCase(
            driverRequestService: gh<_i7.IGetDriverRequestService>()));
    gh.factory<_i20.IFinishDriverRequestUseCase>(
        () => _i21.FinishDriverRequestUseCase(
              driverRequestService: gh<_i20.IFinishDriverRequestService>(),
              userService: gh<_i20.IUserRepository>(),
            ));
    gh.factory<_i7.IGetPaymentsUseCase>(
        () => _i22.GetPaymentsUseCase(gh<_i7.IPaymentRepository>()));
    gh.factory<_i7.IGetUserUseCase>(() => _i15.GetUserUseCase(
          authenticationService: gh<_i7.IAuthenticationService>(),
          userRepository: gh<_i7.IUserRepository>(),
        ));
    gh.singleton<_i7.IPhoneAuthenticationService>(
        _i9.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i6.FirebaseAuth>(),
      userRepository: gh<_i7.IUserRepository>(),
    ));
    gh.factory<_i7.IRegisterUseCase>(() => _i15.RegisterUseCase(
          userRepository: gh<_i7.IUserRepository>(),
          authenticationService: gh<_i7.IAuthenticationService>(),
        ));
    gh.factory<_i20.ISendAboutCarSectionUseCase>(
        () => _i21.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i20.IAboutCarSectionService>(),
              userService: gh<_i20.IUserRepository>(),
              uploadFile: gh<_i20.IUploadFile>(),
            ));
    gh.factory<_i20.ISendAboutMeSectionUseCase>(
        () => _i21.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i20.IAboutMeSectionService>(),
              userService: gh<_i20.IUserRepository>(),
              uploadFile: gh<_i20.IUploadFile>(),
            ));
    gh.factory<_i7.ISendCodeUseCase>(
        () => _i15.SendCodeUseCase(gh<_i7.IPhoneAuthenticationService>()));
    gh.factory<_i20.ISendDNISectionUseCase>(() => _i21.SendDNISectionUseCase(
          dniSectionService: gh<_i20.IDNISectionService>(),
          userService: gh<_i20.IUserRepository>(),
          uploadFile: gh<_i20.IUploadFile>(),
        ));
    gh.factory<_i20.ISendDriverLicenseSectionUseCase>(() =>
        _i21.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i20.IDriverLicenseSectionService>(),
          userService: gh<_i20.IUserRepository>(),
          uploadFile: gh<_i20.IUploadFile>(),
        ));
    gh.factory<_i20.ISendDriverRequestUseCase>(
        () => _i21.SendDriverRequestUseCase(
              driverRequestService: gh<_i20.ISendDriverRequestService>(),
              userService: gh<_i20.IUserRepository>(),
            ));
    gh.factory<_i20.ISendNoCriminalRecordSectionUseCase>(
        () => _i21.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i20.INoCriminalRecordSectionService>(),
              userService: gh<_i20.IUserRepository>(),
              uploadFile: gh<_i20.IUploadFile>(),
            ));
    gh.factory<_i20.ISendOwnerShipCardSectionUseCase>(() =>
        _i21.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i20.IOwnerShipCardSectionService>(),
          userService: gh<_i20.IUserRepository>(),
          uploadFile: gh<_i20.IUploadFile>(),
        ));
    gh.factory<_i20.ISendSoatSectionUseCase>(() => _i21.SendSoatSectionUseCase(
          soatSectionService: gh<_i20.ISoatSectionService>(),
          userService: gh<_i20.IUserRepository>(),
          uploadFile: gh<_i20.IUploadFile>(),
        ));
    gh.factory<_i20.ISendTechnicalReviewSectionUseCase>(
        () => _i21.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i20.ITechnicalReviewSectionService>(),
              userService: gh<_i20.IUserRepository>(),
              uploadFile: gh<_i20.IUploadFile>(),
            ));
    gh.factory<_i7.IUpdateProfileUseCase>(() =>
        _i23.UpdateProfileUseCase(userRepository: gh<_i7.IUserRepository>()));
    gh.factory<_i7.ILoginWithPhoneUseCase>(() =>
        _i15.LoginWithPhoneUseCase(gh<_i7.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$DioModule extends _i24.DioModule {}

class _$FirebaseAppModule extends _i24.FirebaseAppModule {}

class _$AppCheckModule extends _i24.AppCheckModule {}

class _$FirebaseAuthModule extends _i24.FirebaseAuthModule {}

class _$FirestoreModule extends _i24.FirestoreModule {}

class _$FirebaseStorageModule extends _i24.FirebaseStorageModule {}
