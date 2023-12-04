// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_app_check/firebase_app_check.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i4;

import '../../../lib.dart' as _i9;
import '../../application/use_cases/authentication_use_case.dart' as _i17;
import '../../application/use_cases/driver_request_use_cases.dart' as _i28;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i26;
import '../../application/use_cases/find_address_use_cases.dart' as _i16;
import '../../application/use_cases/find_file_use_cases.dart' as _i13;
import '../../application/use_cases/profile_use_case.dart' as _i31;
import '../../application/use_cases/request_service_use_case.dart' as _i30;
import '../../application/use_cases/service_action_use_cases.dart' as _i25;
import '../../src.dart' as _i27;
import '../device/services/find_file.dart' as _i12;
import '../device/services/play_sound.dart' as _i19;
import '../firebase/repositories/firebase_payment_repository.dart' as _i18;
import '../firebase/repositories/firebase_user_repository.dart' as _i24;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_service_action_service.dart' as _i20;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i21;
import '../firebase/services/firebase_upload_file_service.dart' as _i23;
import '../google/services/google_find_address_service.dart' as _i15;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i22;
import '../sqflite/services/find_known_address_service.dart' as _i29;
import '../uuid/generate_uuid_service.dart' as _i14;
import 'dependecies.dart' as _i32;

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
    final audioPlayerModule = _$AudioPlayerModule();
    final databaseModule = _$DatabaseModule();
    final dioModule = _$DioModule();
    final firebaseAppModule = _$FirebaseAppModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    gh.lazySingleton<_i3.AudioPlayer>(() => audioPlayerModule.audioPlayer);
    await gh.lazySingletonAsync<_i4.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Dio>(() => dioModule.dio);
    await gh.factoryAsync<_i6.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i7.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    gh.factory<_i9.IAboutCarSectionService>(() =>
        _i10.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAboutMeSectionService>(() =>
        _i10.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAuthenticationService>(
        () => _i11.FirebaseAuthService(firebaseAuth: gh<_i8.FirebaseAuth>()));
    gh.factory<_i9.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IFileSearchService>(() => _i12.FindFileService());
    gh.factory<_i9.IFindFileUseCase>(
        () => _i13.FindFileUseCase(gh<_i9.IFileSearchService>()));
    gh.factory<_i9.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGenerateUuid>(() => _i14.GenerateUuidService());
    gh.factory<_i9.IGetAddressByGeopointService>(
        () => _i15.GoogleGetAddressByGeopointService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressByGeopointUseCase>(() =>
        _i16.GetMyAddressByGeopointUseCase(
            gh<_i9.IGetAddressByGeopointService>()));
    gh.factory<_i9.IGetAddressByQueryService>(
        () => _i15.GoogleFindAddressService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressesByQueryUseCase>(() =>
        _i16.GetAddressesByQueryUseCase(gh<_i9.IGetAddressByQueryService>()));
    gh.factory<_i9.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ILogoutUseCase>(
        () => _i17.LogoutUseCase(gh<_i9.IAuthenticationService>()));
    gh.factory<_i9.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPaymentRepository>(
        () => _i18.FirebasePaymentRepository(gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPlaySound>(
        () => _i19.AudioPlayerPlaySound(gh<_i3.AudioPlayer>()));
    gh.factory<_i9.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceActionService>(() =>
        _i20.FirebaseServiceActionService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceDriverActionService>(() =>
        _i21.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITravelPointRepository>(
        () => _i22.SqfliteTravelPointRepository(gh<_i4.Database>()));
    gh.factory<_i9.IUploadFile>(() => _i23.FirebaseUploadFileService(
        firebaseStorage: gh<_i9.FirebaseStorage>()));
    gh.factory<_i9.IUserRepository>(() =>
        _i24.FirebaseUserRepository(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAcceptRequestServiceUseCase>(() =>
        _i25.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.ICancelRequestServiceUseCase>(() =>
        _i25.CancelRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IFetchDriverRequestUseCase>(() =>
        _i26.FetchDriverRequestUseCase(
            driverRequestService: gh<_i9.IGetDriverRequestService>()));
    gh.factory<_i27.IFinishDriverRequestUseCase>(
        () => _i28.FinishDriverRequestUseCase(
              driverRequestService: gh<_i27.IFinishDriverRequestService>(),
              userService: gh<_i27.IUserRepository>(),
            ));
    gh.factory<_i9.IGetKnownAddressesService>(() =>
        _i29.SqfliteGetKnownAddressesService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.IGetKnownAddressesUseCase>(() =>
        _i16.GetKnownAddressesUseCase(gh<_i9.IGetKnownAddressesService>()));
    gh.factory<_i9.IGetPaymentsUseCase>(
        () => _i30.GetPaymentsUseCase(gh<_i9.IPaymentRepository>()));
    gh.factory<_i9.IGetUserUseCase>(() => _i17.GetUserUseCase(
          authenticationService: gh<_i9.IAuthenticationService>(),
          userRepository: gh<_i9.IUserRepository>(),
        ));
    gh.factory<_i9.IListenAllRequestServiceUseCase>(() =>
        _i25.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceUseCase>(() =>
        _i25.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.singleton<_i9.IPhoneAuthenticationService>(
        _i11.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i8.FirebaseAuth>(),
      userRepository: gh<_i9.IUserRepository>(),
    ));
    gh.factory<_i9.IRegisterUseCase>(() => _i17.RegisterUseCase(
          userRepository: gh<_i9.IUserRepository>(),
          authenticationService: gh<_i9.IAuthenticationService>(),
        ));
    gh.factory<_i9.ISaveAddressService>(
        () => _i29.SqfliteSaveAddressService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.ISaveAddressUseCase>(
        () => _i16.SaveAddressUseCase(gh<_i9.ISaveAddressService>()));
    gh.factory<_i27.ISendAboutCarSectionUseCase>(
        () => _i28.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i27.IAboutCarSectionService>(),
              userService: gh<_i27.IUserRepository>(),
              uploadFile: gh<_i27.IUploadFile>(),
            ));
    gh.factory<_i27.ISendAboutMeSectionUseCase>(
        () => _i28.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i27.IAboutMeSectionService>(),
              userService: gh<_i27.IUserRepository>(),
              uploadFile: gh<_i27.IUploadFile>(),
            ));
    gh.factory<_i9.ISendCodeUseCase>(
        () => _i17.SendCodeUseCase(gh<_i9.IPhoneAuthenticationService>()));
    gh.factory<_i9.ISendCounterOfferUseCase>(() => _i25.SendCounterOfferUseCase(
          serviceActionService: gh<_i9.IServiceDriverActionService>(),
          generateUuid: gh<_i9.IGenerateUuid>(),
        ));
    gh.factory<_i27.ISendDNISectionUseCase>(() => _i28.SendDNISectionUseCase(
          dniSectionService: gh<_i27.IDNISectionService>(),
          userService: gh<_i27.IUserRepository>(),
          uploadFile: gh<_i27.IUploadFile>(),
        ));
    gh.factory<_i27.ISendDriverLicenseSectionUseCase>(() =>
        _i28.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i27.IDriverLicenseSectionService>(),
          userService: gh<_i27.IUserRepository>(),
          uploadFile: gh<_i27.IUploadFile>(),
        ));
    gh.factory<_i27.ISendDriverRequestUseCase>(
        () => _i28.SendDriverRequestUseCase(
              driverRequestService: gh<_i27.ISendDriverRequestService>(),
              userService: gh<_i27.IUserRepository>(),
            ));
    gh.factory<_i27.ISendNoCriminalRecordSectionUseCase>(
        () => _i28.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i27.INoCriminalRecordSectionService>(),
              userService: gh<_i27.IUserRepository>(),
              uploadFile: gh<_i27.IUploadFile>(),
            ));
    gh.factory<_i27.ISendOwnerShipCardSectionUseCase>(() =>
        _i28.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i27.IOwnerShipCardSectionService>(),
          userService: gh<_i27.IUserRepository>(),
          uploadFile: gh<_i27.IUploadFile>(),
        ));
    gh.factory<_i9.ISendRequestServiceUseCase>(
        () => _i25.SendRequestServiceUseCase(
              serviceActionService: gh<_i9.IServiceActionService>(),
              generateUuid: gh<_i9.IGenerateUuid>(),
            ));
    gh.factory<_i27.ISendSoatSectionUseCase>(() => _i28.SendSoatSectionUseCase(
          soatSectionService: gh<_i27.ISoatSectionService>(),
          userService: gh<_i27.IUserRepository>(),
          uploadFile: gh<_i27.IUploadFile>(),
        ));
    gh.factory<_i27.ISendTechnicalReviewSectionUseCase>(
        () => _i28.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i27.ITechnicalReviewSectionService>(),
              userService: gh<_i27.IUserRepository>(),
              uploadFile: gh<_i27.IUploadFile>(),
            ));
    gh.factory<_i9.IUpdateProfileUseCase>(() =>
        _i31.UpdateProfileUseCase(userRepository: gh<_i9.IUserRepository>()));
    gh.factory<_i9.ILoginWithPhoneUseCase>(() =>
        _i17.LoginWithPhoneUseCase(gh<_i9.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i32.AudioPlayerModule {}

class _$DatabaseModule extends _i32.DatabaseModule {}

class _$DioModule extends _i32.DioModule {}

class _$FirebaseAppModule extends _i32.FirebaseAppModule {}

class _$AppCheckModule extends _i32.AppCheckModule {}

class _$FirebaseAuthModule extends _i32.FirebaseAuthModule {}

class _$FirestoreModule extends _i32.FirestoreModule {}

class _$FirebaseStorageModule extends _i32.FirebaseStorageModule {}
