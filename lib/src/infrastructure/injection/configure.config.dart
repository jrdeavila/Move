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
import '../../application/use_cases/authentication_use_case.dart' as _i27;
import '../../application/use_cases/bonus_use_case.dart' as _i26;
import '../../application/use_cases/driver_request_use_cases.dart' as _i39;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i37;
import '../../application/use_cases/find_address_use_cases.dart' as _i25;
import '../../application/use_cases/find_file_use_cases.dart' as _i22;
import '../../application/use_cases/profile_use_case.dart' as _i42;
import '../../application/use_cases/request_service_use_case.dart' as _i41;
import '../../application/use_cases/service_action_use_cases.dart' as _i15;
import '../../src.dart' as _i38;
import '../device/services/background_notification_service.dart' as _i12;
import '../device/services/connection_service.dart' as _i19;
import '../device/services/find_file.dart' as _i21;
import '../device/services/permission_service.dart' as _i30;
import '../device/services/play_sound.dart' as _i31;
import '../device/services/url_launcher_call_service.dart' as _i13;
import '../device/services/whatsapp_chat_message.dart' as _i16;
import '../domain/services/call_client_service.dart' as _i36;
import '../domain/services/chat_client_service.dart' as _i17;
import '../firebase/repositories/firebase_payment_repository.dart' as _i29;
import '../firebase/repositories/firebase_user_repository.dart' as _i35;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i20;
import '../firebase/services/firebase_profile_service.dart' as _i32;
import '../firebase/services/firebase_service_action_service.dart' as _i14;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i28;
import '../firebase/services/firebase_upload_file_service.dart' as _i34;
import '../firebase/services/firebase_user_bonus_service.dart' as _i18;
import '../google/services/google_find_address_service.dart' as _i24;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i33;
import '../sqflite/services/find_known_address_service.dart' as _i40;
import '../uuid/generate_uuid_service.dart' as _i23;
import 'dependecies.dart' as _i43;

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
    final flutterLocalNotificationModule = _$FlutterLocalNotificationModule();
    final googleSignInModule = _$GoogleSignInModule();
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
    await gh.lazySingletonAsync<_i9.FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationModule.flutterLocalNotificationsPlugin,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.GoogleSignIn>(
      () => googleSignInModule.googleSignIn,
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
    gh.factory<_i9.IBackgroundNotificationService>(() =>
        _i12.BackgroundNotificationService(
            flutterLocalNotificationsPlugin:
                gh<_i9.FlutterLocalNotificationsPlugin>()));
    gh.lazySingleton<_i9.ICallService>(() => _i13.UrlLauncherCallService());
    gh.factory<_i9.IChangeRequestServiceOfferService>(() =>
        _i14.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IChangeRequestServiceOfferUseCase>(() =>
        _i15.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i9.IChangeRequestServiceOfferService>()));
    gh.lazySingleton<_i9.IChatService>(() => _i16.WhatsappChatMessageService());
    gh.factory<_i9.IChatWithClientService>(
        () => _i17.ChatWithClientService(gh<_i9.IChatService>()));
    gh.factory<_i9.IChatWithClientUseCase>(() => _i15.ChatWithClientUseCase(
        chatWithClientService: gh<_i9.IChatWithClientService>()));
    gh.factory<_i9.IClientPointsService>(() => _i18.FirebaseClientPointsService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.lazySingleton<_i9.IConnectionService>(
        () => _i19.DeviceConnectionService());
    gh.factory<_i9.IConsultServiceConfigurationService>(() =>
        _i20.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverBalanceService>(() =>
        _i18.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverPaymentService>(() =>
        _i20.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          driverBalanceService: gh<_i9.IDriverBalanceService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFileSearchService>(() => _i21.FindFileService());
    gh.factory<_i9.IFindFileUseCase>(
        () => _i22.FindFileUseCase(gh<_i9.IFileSearchService>()));
    gh.factory<_i9.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGenerateUuid>(() => _i23.GenerateUuidService());
    gh.factory<_i9.IGetAddressByGeopointService>(
        () => _i24.GoogleGetAddressByGeopointService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressByGeopointUseCase>(() =>
        _i25.GetMyAddressByGeopointUseCase(
            gh<_i9.IGetAddressByGeopointService>()));
    gh.factory<_i9.IGetAddressByQueryService>(
        () => _i24.GoogleFindAddressService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressesByQueryUseCase>(() =>
        _i25.GetAddressesByQueryUseCase(gh<_i9.IGetAddressByQueryService>()));
    gh.factory<_i9.IGetDriverLocationService>(() =>
        _i14.FirebaseGetDriverLocationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetMyPointsUseCase>(
        () => _i26.GetMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.factory<_i9.IGetServiceCommonOffertsUseCase>(() =>
        _i15.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i9.IConsultServiceConfigurationService>()));
    gh.factory<_i9.IListenDriverLocationUseCase>(() =>
        _i15.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i9.IGetDriverLocationService>()));
    gh.factory<_i9.IListenMyBalanceUseCase>(
        () => _i26.ListenMyBalanceUseCase(gh<_i9.IDriverBalanceService>()));
    gh.factory<_i9.IListenMyPointsUseCase>(
        () => _i26.ListenMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.singleton<_i9.ILoginWithGoogleService>(_i11.LoginWithGoogleService(
      firebaseAuth: gh<_i8.FirebaseAuth>(),
      googleSignIn: gh<_i9.GoogleSignIn>(),
    ));
    gh.factory<_i9.ILoginWithGoogleUseCase>(
        () => _i27.LoginWithGoogleUseCase(gh<_i9.ILoginWithGoogleService>()));
    gh.factory<_i9.ILogoutUseCase>(
        () => _i27.LogoutUseCase(gh<_i9.IAuthenticationService>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceService>(() =>
        _i28.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceUseCase>(() =>
        _i15.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i9.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i9.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPaymentRepository>(
        () => _i29.FirebasePaymentRepository(gh<_i9.FirebaseFirestore>()));
    gh.lazySingleton<_i9.IPermissionService>(
        () => _i30.DevicePermissionService());
    gh.factory<_i9.IPlaySound>(() => _i31.AudioPlayerPlaySound());
    gh.factory<_i9.IProfileService>(() =>
        _i32.FirebaseProfileService(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceActionService>(() =>
        _i14.FirebaseServiceActionService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceDriverActionService>(() =>
        _i28.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITravelPointRepository>(
        () => _i33.SqfliteTravelPointRepository(gh<_i4.Database>()));
    gh.factory<_i9.IUpdateProfileLocationDataUseCase>(() =>
        _i15.UpdateProfileLocationDataUseCase(
            profileService: gh<_i9.IProfileService>()));
    gh.factory<_i9.IUploadFile>(() => _i34.FirebaseUploadFileService(
        firebaseStorage: gh<_i9.FirebaseStorage>()));
    gh.factory<_i9.IUserRepository>(() =>
        _i35.FirebaseUserRepository(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAcceptCounterOfferUseCase>(() =>
        _i15.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IAcceptRequestServiceUseCase>(() =>
        _i15.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.ICallClientService>(
        () => _i36.CallClientService(gh<_i9.ICallService>()));
    gh.factory<_i9.ICallClientUseCase>(() => _i15.CallClientUseCase(
        callClientService: gh<_i9.ICallClientService>()));
    gh.factory<_i9.ICancelCounterOfferUseCase>(() =>
        _i15.CancelCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.ICancelRequestServiceUseCase>(() =>
        _i15.CancelRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IClientBonusService>(() => _i20.FirebaseClientbonusService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          clientPointsService: gh<_i9.IClientPointsService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFetchDriverRequestUseCase>(() =>
        _i37.FetchDriverRequestUseCase(
            driverRequestService: gh<_i9.IGetDriverRequestService>()));
    gh.factory<_i38.IFinishDriverRequestUseCase>(
        () => _i39.FinishDriverRequestUseCase(
              driverRequestService: gh<_i38.IFinishDriverRequestService>(),
              userService: gh<_i38.IUserRepository>(),
            ));
    gh.factory<_i9.IGetKnownAddressesService>(() =>
        _i40.SqfliteGetKnownAddressesService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.IGetKnownAddressesUseCase>(() =>
        _i25.GetKnownAddressesUseCase(gh<_i9.IGetKnownAddressesService>()));
    gh.factory<_i9.IGetPaymentsUseCase>(
        () => _i41.GetPaymentsUseCase(gh<_i9.IPaymentRepository>()));
    gh.factory<_i9.IGetUserUseCase>(() => _i27.GetUserUseCase(
          authenticationService: gh<_i9.IAuthenticationService>(),
          userRepository: gh<_i9.IUserRepository>(),
        ));
    gh.factory<_i9.IListenAllRequestServiceUseCase>(() =>
        _i15.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i15.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceUseCase>(() =>
        _i15.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IListenRequestServiceCounterOffersUseCase>(() =>
        _i15.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IRegisterUseCase>(() => _i27.RegisterUseCase(
          userRepository: gh<_i9.IUserRepository>(),
          authenticationService: gh<_i9.IAuthenticationService>(),
        ));
    gh.factory<_i9.ISaveAddressService>(
        () => _i40.SqfliteSaveAddressService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.ISaveAddressUseCase>(
        () => _i25.SaveAddressUseCase(gh<_i9.ISaveAddressService>()));
    gh.factory<_i38.ISendAboutCarSectionUseCase>(
        () => _i39.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i38.IAboutCarSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i38.ISendAboutMeSectionUseCase>(
        () => _i39.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i38.IAboutMeSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i9.ISendCounterOfferUseCase>(() => _i15.SendCounterOfferUseCase(
        serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i38.ISendDNISectionUseCase>(() => _i39.SendDNISectionUseCase(
          dniSectionService: gh<_i38.IDNISectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendDriverLicenseSectionUseCase>(() =>
        _i39.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i38.IDriverLicenseSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendDriverRequestUseCase>(
        () => _i39.SendDriverRequestUseCase(
              driverRequestService: gh<_i38.ISendDriverRequestService>(),
              userService: gh<_i38.IUserRepository>(),
            ));
    gh.factory<_i38.ISendNoCriminalRecordSectionUseCase>(
        () => _i39.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i38.INoCriminalRecordSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i38.ISendOwnerShipCardSectionUseCase>(() =>
        _i39.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i38.IOwnerShipCardSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i9.ISendRequestServiceUseCase>(
        () => _i15.SendRequestServiceUseCase(
              serviceActionService: gh<_i9.IServiceActionService>(),
              generateUuid: gh<_i9.IGenerateUuid>(),
            ));
    gh.factory<_i38.ISendSoatSectionUseCase>(() => _i39.SendSoatSectionUseCase(
          soatSectionService: gh<_i38.ISoatSectionService>(),
          userService: gh<_i38.IUserRepository>(),
          uploadFile: gh<_i38.IUploadFile>(),
        ));
    gh.factory<_i38.ISendTechnicalReviewSectionUseCase>(
        () => _i39.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i38.ITechnicalReviewSectionService>(),
              userService: gh<_i38.IUserRepository>(),
              uploadFile: gh<_i38.IUploadFile>(),
            ));
    gh.factory<_i9.IServiceFinishDriverActionService>(
        () => _i28.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i9.FirebaseFirestore>(),
              clientBonusService: gh<_i9.IClientBonusService>(),
              driverPaymentService: gh<_i9.IDriverPaymentService>(),
            ));
    gh.factory<_i9.IUpdateProfileUseCase>(() =>
        _i42.UpdateProfileUseCase(userRepository: gh<_i9.IUserRepository>()));
    gh.factory<_i9.IFinishServiceDriverUseCase>(() =>
        _i15.FinishServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceFinishDriverActionService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i43.AudioPlayerModule {}

class _$DatabaseModule extends _i43.DatabaseModule {}

class _$DioModule extends _i43.DioModule {}

class _$FirebaseAppModule extends _i43.FirebaseAppModule {}

class _$AppCheckModule extends _i43.AppCheckModule {}

class _$FirebaseAuthModule extends _i43.FirebaseAuthModule {}

class _$FirestoreModule extends _i43.FirestoreModule {}

class _$FirebaseStorageModule extends _i43.FirebaseStorageModule {}

class _$FlutterLocalNotificationModule
    extends _i43.FlutterLocalNotificationModule {}

class _$GoogleSignInModule extends _i43.GoogleSignInModule {}
