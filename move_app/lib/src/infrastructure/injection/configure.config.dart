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
import '../../application/use_cases/authentication_use_case.dart' as _i22;
import '../../application/use_cases/bonification_use_case.dart' as _i20;
import '../../application/use_cases/driver_request_use_cases.dart' as _i32;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i30;
import '../../application/use_cases/find_address_use_cases.dart' as _i18;
import '../../application/use_cases/find_file_use_cases.dart' as _i15;
import '../../application/use_cases/profile_use_case.dart' as _i35;
import '../../application/use_cases/request_service_use_case.dart' as _i34;
import '../../application/use_cases/service_action_use_cases.dart' as _i21;
import '../../src.dart' as _i31;
import '../device/services/find_file.dart' as _i14;
import '../device/services/play_sound.dart' as _i25;
import '../firebase/repositories/firebase_payment_repository.dart' as _i24;
import '../firebase/repositories/firebase_user_repository.dart' as _i29;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i13;
import '../firebase/services/firebase_profile_service.dart' as _i26;
import '../firebase/services/firebase_service_action_service.dart' as _i19;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i23;
import '../firebase/services/firebase_upload_file_service.dart' as _i28;
import '../firebase/services/firebase_user_bonification_service.dart' as _i12;
import '../google/services/google_find_address_service.dart' as _i17;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i27;
import '../sqflite/services/find_known_address_service.dart' as _i33;
import '../uuid/generate_uuid_service.dart' as _i16;
import 'dependecies.dart' as _i36;

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
    gh.factory<_i9.IClientPointsService>(() => _i12.FirebaseClientPointsService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IConsultServiceConfigurationService>(() =>
        _i13.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverBalanceService>(() =>
        _i12.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverPaymentService>(() =>
        _i13.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          driverBalanceService: gh<_i9.IDriverBalanceService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFileSearchService>(() => _i14.FindFileService());
    gh.factory<_i9.IFindFileUseCase>(
        () => _i15.FindFileUseCase(gh<_i9.IFileSearchService>()));
    gh.factory<_i9.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGenerateUuid>(() => _i16.GenerateUuidService());
    gh.factory<_i9.IGetAddressByGeopointService>(
        () => _i17.GoogleGetAddressByGeopointService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressByGeopointUseCase>(() =>
        _i18.GetMyAddressByGeopointUseCase(
            gh<_i9.IGetAddressByGeopointService>()));
    gh.factory<_i9.IGetAddressByQueryService>(
        () => _i17.GoogleFindAddressService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressesByQueryUseCase>(() =>
        _i18.GetAddressesByQueryUseCase(gh<_i9.IGetAddressByQueryService>()));
    gh.factory<_i9.IGetDriverLocationService>(() =>
        _i19.FirebaseGetDriverLocationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetMyPointsUseCase>(
        () => _i20.GetMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.factory<_i9.IGetServiceCommonOffertsUseCase>(() =>
        _i21.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i9.IConsultServiceConfigurationService>()));
    gh.factory<_i9.IListenDriverLocationUseCase>(() =>
        _i21.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i9.IGetDriverLocationService>()));
    gh.factory<_i9.IListenMyBalanceUseCase>(
        () => _i20.ListenMyBalanceUseCase(gh<_i9.IDriverBalanceService>()));
    gh.factory<_i9.IListenMyPointsUseCase>(
        () => _i20.ListenMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.factory<_i9.ILogoutUseCase>(
        () => _i22.LogoutUseCase(gh<_i9.IAuthenticationService>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceService>(() =>
        _i23.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceUseCase>(() =>
        _i21.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i9.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i9.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPaymentRepository>(
        () => _i24.FirebasePaymentRepository(gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPlaySound>(
        () => _i25.AudioPlayerPlaySound(gh<_i3.AudioPlayer>()));
    gh.factory<_i9.IProfileService>(() =>
        _i26.FirebaseProfileService(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceActionService>(() =>
        _i19.FirebaseServiceActionService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceDriverActionService>(() =>
        _i23.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITravelPointRepository>(
        () => _i27.SqfliteTravelPointRepository(gh<_i4.Database>()));
    gh.factory<_i9.IUpdateProfileLocationDataUseCase>(() =>
        _i21.UpdateProfileLocationDataUseCase(
            profileService: gh<_i9.IProfileService>()));
    gh.factory<_i9.IUploadFile>(() => _i28.FirebaseUploadFileService(
        firebaseStorage: gh<_i9.FirebaseStorage>()));
    gh.factory<_i9.IUserRepository>(() =>
        _i29.FirebaseUserRepository(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAcceptCounterOfferUseCase>(() =>
        _i21.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IAcceptRequestServiceUseCase>(() =>
        _i21.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.ICancelCounterOfferUseCase>(() =>
        _i21.CancelCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.ICancelRequestServiceUseCase>(() =>
        _i21.CancelRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IClientBonificationService>(() =>
        _i13.FirebaseClientBonificationService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          clientPointsService: gh<_i9.IClientPointsService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFetchDriverRequestUseCase>(() =>
        _i30.FetchDriverRequestUseCase(
            driverRequestService: gh<_i9.IGetDriverRequestService>()));
    gh.factory<_i31.IFinishDriverRequestUseCase>(
        () => _i32.FinishDriverRequestUseCase(
              driverRequestService: gh<_i31.IFinishDriverRequestService>(),
              userService: gh<_i31.IUserRepository>(),
            ));
    gh.factory<_i9.IGetKnownAddressesService>(() =>
        _i33.SqfliteGetKnownAddressesService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.IGetKnownAddressesUseCase>(() =>
        _i18.GetKnownAddressesUseCase(gh<_i9.IGetKnownAddressesService>()));
    gh.factory<_i9.IGetPaymentsUseCase>(
        () => _i34.GetPaymentsUseCase(gh<_i9.IPaymentRepository>()));
    gh.factory<_i9.IGetUserUseCase>(() => _i22.GetUserUseCase(
          authenticationService: gh<_i9.IAuthenticationService>(),
          userRepository: gh<_i9.IUserRepository>(),
        ));
    gh.factory<_i9.IListenAllRequestServiceUseCase>(() =>
        _i21.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i21.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceUseCase>(() =>
        _i21.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IListenRequestServiceCounterOffersUseCase>(() =>
        _i21.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.singleton<_i9.IPhoneAuthenticationService>(
        _i11.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i8.FirebaseAuth>(),
      userRepository: gh<_i9.IUserRepository>(),
    ));
    gh.factory<_i9.IRegisterUseCase>(() => _i22.RegisterUseCase(
          userRepository: gh<_i9.IUserRepository>(),
          authenticationService: gh<_i9.IAuthenticationService>(),
        ));
    gh.factory<_i9.ISaveAddressService>(
        () => _i33.SqfliteSaveAddressService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.ISaveAddressUseCase>(
        () => _i18.SaveAddressUseCase(gh<_i9.ISaveAddressService>()));
    gh.factory<_i31.ISendAboutCarSectionUseCase>(
        () => _i32.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i31.IAboutCarSectionService>(),
              userService: gh<_i31.IUserRepository>(),
              uploadFile: gh<_i31.IUploadFile>(),
            ));
    gh.factory<_i31.ISendAboutMeSectionUseCase>(
        () => _i32.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i31.IAboutMeSectionService>(),
              userService: gh<_i31.IUserRepository>(),
              uploadFile: gh<_i31.IUploadFile>(),
            ));
    gh.factory<_i9.ISendCodeUseCase>(
        () => _i22.SendCodeUseCase(gh<_i9.IPhoneAuthenticationService>()));
    gh.factory<_i9.ISendCounterOfferUseCase>(() => _i21.SendCounterOfferUseCase(
        serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i31.ISendDNISectionUseCase>(() => _i32.SendDNISectionUseCase(
          dniSectionService: gh<_i31.IDNISectionService>(),
          userService: gh<_i31.IUserRepository>(),
          uploadFile: gh<_i31.IUploadFile>(),
        ));
    gh.factory<_i31.ISendDriverLicenseSectionUseCase>(() =>
        _i32.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i31.IDriverLicenseSectionService>(),
          userService: gh<_i31.IUserRepository>(),
          uploadFile: gh<_i31.IUploadFile>(),
        ));
    gh.factory<_i31.ISendDriverRequestUseCase>(
        () => _i32.SendDriverRequestUseCase(
              driverRequestService: gh<_i31.ISendDriverRequestService>(),
              userService: gh<_i31.IUserRepository>(),
            ));
    gh.factory<_i31.ISendNoCriminalRecordSectionUseCase>(
        () => _i32.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i31.INoCriminalRecordSectionService>(),
              userService: gh<_i31.IUserRepository>(),
              uploadFile: gh<_i31.IUploadFile>(),
            ));
    gh.factory<_i31.ISendOwnerShipCardSectionUseCase>(() =>
        _i32.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i31.IOwnerShipCardSectionService>(),
          userService: gh<_i31.IUserRepository>(),
          uploadFile: gh<_i31.IUploadFile>(),
        ));
    gh.factory<_i9.ISendRequestServiceUseCase>(
        () => _i21.SendRequestServiceUseCase(
              serviceActionService: gh<_i9.IServiceActionService>(),
              generateUuid: gh<_i9.IGenerateUuid>(),
            ));
    gh.factory<_i31.ISendSoatSectionUseCase>(() => _i32.SendSoatSectionUseCase(
          soatSectionService: gh<_i31.ISoatSectionService>(),
          userService: gh<_i31.IUserRepository>(),
          uploadFile: gh<_i31.IUploadFile>(),
        ));
    gh.factory<_i31.ISendTechnicalReviewSectionUseCase>(
        () => _i32.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i31.ITechnicalReviewSectionService>(),
              userService: gh<_i31.IUserRepository>(),
              uploadFile: gh<_i31.IUploadFile>(),
            ));
    gh.factory<_i9.IServiceFinishDriverActionService>(
        () => _i23.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i9.FirebaseFirestore>(),
              clientBoniticationService: gh<_i9.IClientBonificationService>(),
              driverPaymentService: gh<_i9.IDriverPaymentService>(),
            ));
    gh.factory<_i9.IUpdateProfileUseCase>(() =>
        _i35.UpdateProfileUseCase(userRepository: gh<_i9.IUserRepository>()));
    gh.factory<_i9.IFinishServiceDriverUseCase>(() =>
        _i21.FinishServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceFinishDriverActionService>()));
    gh.factory<_i9.ILoginWithPhoneUseCase>(() =>
        _i22.LoginWithPhoneUseCase(gh<_i9.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i36.AudioPlayerModule {}

class _$DatabaseModule extends _i36.DatabaseModule {}

class _$DioModule extends _i36.DioModule {}

class _$FirebaseAppModule extends _i36.FirebaseAppModule {}

class _$AppCheckModule extends _i36.AppCheckModule {}

class _$FirebaseAuthModule extends _i36.FirebaseAuthModule {}

class _$FirestoreModule extends _i36.FirestoreModule {}

class _$FirebaseStorageModule extends _i36.FirebaseStorageModule {}
