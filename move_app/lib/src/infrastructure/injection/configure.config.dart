// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_app_check/firebase_app_check.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_core/firebase_core.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i3;

import '../../../lib.dart' as _i8;
import '../../application/use_cases/authentication_use_case.dart' as _i16;
import '../../application/use_cases/driver_request_use_cases.dart' as _i24;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i22;
import '../../application/use_cases/find_address_use_cases.dart' as _i15;
import '../../application/use_cases/find_file_use_cases.dart' as _i12;
import '../../application/use_cases/profile_use_case.dart' as _i28;
import '../../application/use_cases/request_service_use_case.dart' as _i26;
import '../../application/use_cases/service_action_use_cases.dart' as _i27;
import '../../src.dart' as _i23;
import '../device/services/find_file.dart' as _i11;
import '../firebase/repositories/firebase_payment_repository.dart' as _i17;
import '../firebase/repositories/firebase_user_repository.dart' as _i21;
import '../firebase/services/firebase_auth_service.dart' as _i10;
import '../firebase/services/firebase_driver_request_service.dart' as _i9;
import '../firebase/services/firebase_service_action_service.dart' as _i18;
import '../firebase/services/firebase_upload_file_service.dart' as _i20;
import '../google/services/google_find_address_service.dart' as _i14;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i19;
import '../sqflite/services/find_known_address_service.dart' as _i25;
import '../uuid/generate_uuid_service.dart' as _i13;
import 'dependecies.dart' as _i29;

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
    final databaseModule = _$DatabaseModule();
    final dioModule = _$DioModule();
    final firebaseAppModule = _$FirebaseAppModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    await gh.lazySingletonAsync<_i3.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => dioModule.dio);
    await gh.factoryAsync<_i5.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i7.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    gh.factory<_i8.IAboutCarSectionService>(() =>
        _i9.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IAboutMeSectionService>(() =>
        _i9.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IAuthenticationService>(
        () => _i10.FirebaseAuthService(firebaseAuth: gh<_i7.FirebaseAuth>()));
    gh.factory<_i8.IDNISectionService>(() => _i9.FirebaseDNISectionService(
        firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IDriverLicenseSectionService>(() =>
        _i9.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IFileSearchService>(() => _i11.FindFileService());
    gh.factory<_i8.IFindFileUseCase>(
        () => _i12.FindFileUseCase(gh<_i8.IFileSearchService>()));
    gh.factory<_i8.IFinishDriverRequestService>(() =>
        _i9.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IGenerateUuid>(() => _i13.GenerateUuidService());
    gh.factory<_i8.IGetAddressByGeopointService>(
        () => _i14.GoogleGetAddressByGeopointService(gh<_i4.Dio>()));
    gh.factory<_i8.IGetAddressByGeopointUseCase>(() =>
        _i15.GetMyAddressByGeopointUseCase(
            gh<_i8.IGetAddressByGeopointService>()));
    gh.factory<_i8.IGetAddressByQueryService>(
        () => _i14.GoogleFindAddressService(gh<_i4.Dio>()));
    gh.factory<_i8.IGetAddressesByQueryUseCase>(() =>
        _i15.GetAddressesByQueryUseCase(gh<_i8.IGetAddressByQueryService>()));
    gh.factory<_i8.IGetDriverRequestService>(() =>
        _i9.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.ILogoutUseCase>(
        () => _i16.LogoutUseCase(gh<_i8.IAuthenticationService>()));
    gh.factory<_i8.INoCriminalRecordSectionService>(() =>
        _i9.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IOwnerShipCardSectionService>(() =>
        _i9.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IPaymentRepository>(
        () => _i17.FirebasePaymentRepository(gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.ISendDriverRequestService>(() =>
        _i9.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IServiceActionService>(() =>
        _i18.FirebaseServiceActionService(
            firestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.ISoatSectionService>(() => _i9.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.ITechnicalReviewSectionService>(() =>
        _i9.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.ITravelPointRepository>(
        () => _i19.SqfliteTravelPointRepository(gh<_i3.Database>()));
    gh.factory<_i8.IUploadFile>(() => _i20.FirebaseUploadFileService(
        firebaseStorage: gh<_i8.FirebaseStorage>()));
    gh.factory<_i8.IUserRepository>(() =>
        _i21.FirebaseUserRepository(firestore: gh<_i8.FirebaseFirestore>()));
    gh.factory<_i8.IFetchDriverRequestUseCase>(() =>
        _i22.FetchDriverRequestUseCase(
            driverRequestService: gh<_i8.IGetDriverRequestService>()));
    gh.factory<_i23.IFinishDriverRequestUseCase>(
        () => _i24.FinishDriverRequestUseCase(
              driverRequestService: gh<_i23.IFinishDriverRequestService>(),
              userService: gh<_i23.IUserRepository>(),
            ));
    gh.factory<_i8.IGetKnownAddressesService>(() =>
        _i25.SqfliteGetKnownAddressesService(gh<_i8.ITravelPointRepository>()));
    gh.factory<_i8.IGetKnownAddressesUseCase>(() =>
        _i15.GetKnownAddressesUseCase(gh<_i8.IGetKnownAddressesService>()));
    gh.factory<_i8.IGetPaymentsUseCase>(
        () => _i26.GetPaymentsUseCase(gh<_i8.IPaymentRepository>()));
    gh.factory<_i8.IGetUserUseCase>(() => _i16.GetUserUseCase(
          authenticationService: gh<_i8.IAuthenticationService>(),
          userRepository: gh<_i8.IUserRepository>(),
        ));
    gh.singleton<_i8.IPhoneAuthenticationService>(
        _i10.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i7.FirebaseAuth>(),
      userRepository: gh<_i8.IUserRepository>(),
    ));
    gh.factory<_i8.IRegisterUseCase>(() => _i16.RegisterUseCase(
          userRepository: gh<_i8.IUserRepository>(),
          authenticationService: gh<_i8.IAuthenticationService>(),
        ));
    gh.factory<_i8.ISaveAddressService>(
        () => _i25.SqfliteSaveAddressService(gh<_i8.ITravelPointRepository>()));
    gh.factory<_i8.ISaveAddressUseCase>(
        () => _i15.SaveAddressUseCase(gh<_i8.ISaveAddressService>()));
    gh.factory<_i23.ISendAboutCarSectionUseCase>(
        () => _i24.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i23.IAboutCarSectionService>(),
              userService: gh<_i23.IUserRepository>(),
              uploadFile: gh<_i23.IUploadFile>(),
            ));
    gh.factory<_i23.ISendAboutMeSectionUseCase>(
        () => _i24.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i23.IAboutMeSectionService>(),
              userService: gh<_i23.IUserRepository>(),
              uploadFile: gh<_i23.IUploadFile>(),
            ));
    gh.factory<_i8.ISendCodeUseCase>(
        () => _i16.SendCodeUseCase(gh<_i8.IPhoneAuthenticationService>()));
    gh.factory<_i23.ISendDNISectionUseCase>(() => _i24.SendDNISectionUseCase(
          dniSectionService: gh<_i23.IDNISectionService>(),
          userService: gh<_i23.IUserRepository>(),
          uploadFile: gh<_i23.IUploadFile>(),
        ));
    gh.factory<_i23.ISendDriverLicenseSectionUseCase>(() =>
        _i24.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i23.IDriverLicenseSectionService>(),
          userService: gh<_i23.IUserRepository>(),
          uploadFile: gh<_i23.IUploadFile>(),
        ));
    gh.factory<_i23.ISendDriverRequestUseCase>(
        () => _i24.SendDriverRequestUseCase(
              driverRequestService: gh<_i23.ISendDriverRequestService>(),
              userService: gh<_i23.IUserRepository>(),
            ));
    gh.factory<_i23.ISendNoCriminalRecordSectionUseCase>(
        () => _i24.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i23.INoCriminalRecordSectionService>(),
              userService: gh<_i23.IUserRepository>(),
              uploadFile: gh<_i23.IUploadFile>(),
            ));
    gh.factory<_i23.ISendOwnerShipCardSectionUseCase>(() =>
        _i24.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i23.IOwnerShipCardSectionService>(),
          userService: gh<_i23.IUserRepository>(),
          uploadFile: gh<_i23.IUploadFile>(),
        ));
    gh.factory<_i8.ISendRequestServiceUseCase>(
        () => _i27.SendRequestServiceUseCase(
              serviceActionService: gh<_i8.IServiceActionService>(),
              generateUuid: gh<_i8.IGenerateUuid>(),
            ));
    gh.factory<_i23.ISendSoatSectionUseCase>(() => _i24.SendSoatSectionUseCase(
          soatSectionService: gh<_i23.ISoatSectionService>(),
          userService: gh<_i23.IUserRepository>(),
          uploadFile: gh<_i23.IUploadFile>(),
        ));
    gh.factory<_i23.ISendTechnicalReviewSectionUseCase>(
        () => _i24.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i23.ITechnicalReviewSectionService>(),
              userService: gh<_i23.IUserRepository>(),
              uploadFile: gh<_i23.IUploadFile>(),
            ));
    gh.factory<_i8.IUpdateProfileUseCase>(() =>
        _i28.UpdateProfileUseCase(userRepository: gh<_i8.IUserRepository>()));
    gh.factory<_i8.ILoginWithPhoneUseCase>(() =>
        _i16.LoginWithPhoneUseCase(gh<_i8.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$DatabaseModule extends _i29.DatabaseModule {}

class _$DioModule extends _i29.DioModule {}

class _$FirebaseAppModule extends _i29.FirebaseAppModule {}

class _$AppCheckModule extends _i29.AppCheckModule {}

class _$FirebaseAuthModule extends _i29.FirebaseAuthModule {}

class _$FirestoreModule extends _i29.FirestoreModule {}

class _$FirebaseStorageModule extends _i29.FirebaseStorageModule {}
