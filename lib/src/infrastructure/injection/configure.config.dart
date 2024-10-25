// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:audioplayers/audioplayers.dart' as _i656;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_app_check/firebase_app_check.dart' as _i56;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;

import '../../../lib.dart' as _i608;
import '../../application/use_cases/authentication_use_case.dart' as _i377;
import '../../application/use_cases/bonus_use_case.dart' as _i187;
import '../../application/use_cases/driver_request_use_cases.dart' as _i430;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i47;
import '../../application/use_cases/find_address_use_cases.dart' as _i700;
import '../../application/use_cases/find_file_use_cases.dart' as _i514;
import '../../application/use_cases/profile_use_case.dart' as _i879;
import '../../application/use_cases/request_service_use_case.dart' as _i342;
import '../../application/use_cases/service_action_use_cases.dart' as _i878;
import '../../src.dart' as _i697;
import '../device/services/background_notification_service.dart' as _i315;
import '../device/services/connection_service.dart' as _i853;
import '../device/services/find_file.dart' as _i958;
import '../device/services/permission_service.dart' as _i791;
import '../device/services/play_sound.dart' as _i208;
import '../device/services/url_launcher_call_service.dart' as _i59;
import '../device/services/whatsapp_chat_message.dart' as _i666;
import '../domain/services/call_client_service.dart' as _i343;
import '../domain/services/chat_client_service.dart' as _i815;
import '../firebase/repositories/firebase_payment_repository.dart' as _i412;
import '../firebase/repositories/firebase_user_repository.dart' as _i173;
import '../firebase/services/firebase_auth_service.dart' as _i716;
import '../firebase/services/firebase_driver_request_service.dart' as _i496;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i906;
import '../firebase/services/firebase_pay_request_service_with_points_service.dart'
    as _i179;
import '../firebase/services/firebase_profile_service.dart' as _i105;
import '../firebase/services/firebase_qualify_request_service_service.dart'
    as _i384;
import '../firebase/services/firebase_service_action_service.dart' as _i499;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i510;
import '../firebase/services/firebase_upload_file_service.dart' as _i105;
import '../firebase/services/firebase_user_bonus_service.dart' as _i222;
import '../google/services/google_find_address_service.dart' as _i819;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i477;
import '../sqflite/services/find_known_address_service.dart' as _i1043;
import '../uuid/generate_uuid_service.dart' as _i892;
import 'dependecies.dart' as _i1048;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseAppModule = _$FirebaseAppModule();
    final firebaseAuthModule = _$FirebaseAuthModule();
    final firestoreModule = _$FirestoreModule();
    final appCheckModule = _$AppCheckModule();
    final firebaseStorageModule = _$FirebaseStorageModule();
    final googleSignInModule = _$GoogleSignInModule();
    final dioModule = _$DioModule();
    final databaseModule = _$DatabaseModule();
    final audioPlayerModule = _$AudioPlayerModule();
    final flutterLocalNotificationModule = _$FlutterLocalNotificationModule();
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseAppModule.firebaseApp,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i59.FirebaseAuth>(
      () => firebaseAuthModule.firebaseAuth,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.FirebaseFirestore>(
      () => firestoreModule.firestore,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i56.FirebaseAppCheck>(
      () => appCheckModule.appCheck,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.FirebaseStorage>(
      () => firebaseStorageModule.firebaseStorage,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i608.GoogleSignIn>(
      () => googleSignInModule.googleSignIn,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    await gh.lazySingletonAsync<_i779.Database>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i656.AudioPlayer>(() => audioPlayerModule.audioPlayer);
    await gh.lazySingletonAsync<_i608.FlutterLocalNotificationsPlugin>(
      () => flutterLocalNotificationModule.flutterLocalNotificationsPlugin,
      preResolve: true,
    );
    gh.factory<_i608.IPlaySound>(() => _i208.AudioPlayerPlaySound());
    gh.lazySingleton<_i608.IChatService>(
        () => _i666.WhatsappChatMessageService());
    gh.factory<_i608.IUserRepository>(() =>
        _i173.FirebaseUserRepository(firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IUpdateProfileUseCase>(() => _i879.UpdateProfileUseCase(
        userRepository: gh<_i608.IUserRepository>()));
    gh.factory<_i608.IQualifyRequestServiceService>(() =>
        _i384.FirebaseQualifyRequestServiceService(
            gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetAddressByQueryService>(
        () => _i819.GoogleFindAddressService(gh<_i361.Dio>()));
    gh.factory<_i608.IGenerateUuid>(() => _i892.GenerateUuidService());
    gh.factory<_i608.IConsultServiceConfigurationService>(() =>
        _i906.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetAddressByGeopointService>(
        () => _i819.GoogleGetAddressByGeopointService(gh<_i361.Dio>()));
    gh.factory<_i608.IUploadFile>(() => _i105.FirebaseUploadFileService(
        firebaseStorage: gh<_i608.FirebaseStorage>()));
    gh.factory<_i608.IGetQuotaPerPointUseCase>(() =>
        _i187.GetQuotaPerPointUseCase(
            gh<_i608.IConsultServiceConfigurationService>()));
    gh.factory<_i608.IServiceActionService>(() =>
        _i499.FirebaseServiceActionService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetDriverLocationService>(() =>
        _i499.FirebaseGetDriverLocationService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.lazySingleton<_i608.IConnectionService>(
        () => _i853.DeviceConnectionService());
    gh.factory<_i608.IProfileService>(() =>
        _i105.FirebaseProfileService(firestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IQualifyRequestServiceUseCase>(() =>
        _i878.QualifyRequestServiceUseCase(
            qualifyRequestServiceService:
                gh<_i608.IQualifyRequestServiceService>()));
    gh.factory<_i608.IFileSearchService>(() => _i958.FindFileService());
    gh.lazySingleton<_i608.ICallService>(() => _i59.UrlLauncherCallService());
    gh.factory<_i608.IGetPointsPerTravelUseCase>(() =>
        _i187.GetPointsPerTravelUseCase(
            gh<_i608.IConsultServiceConfigurationService>()));
    gh.factory<_i608.ICancelRequestServiceUseCase>(() =>
        _i878.CancelRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IBackgroundNotificationService>(() =>
        _i315.BackgroundNotificationService(
            flutterLocalNotificationsPlugin:
                gh<_i608.FlutterLocalNotificationsPlugin>()));
    gh.factory<_i608.IChangeRequestServiceOfferService>(() =>
        _i499.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i608.FirebaseFirestore>()));
    gh.lazySingleton<_i608.IPermissionService>(
        () => _i791.DevicePermissionService());
    gh.factory<_i608.IOwnerShipCardSectionService>(() =>
        _i496.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDNISectionService>(() => _i496.FirebaseDNISectionService(
        firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetDriverRequestService>(() =>
        _i496.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.ISoatSectionService>(() =>
        _i496.FirebaseSoatSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetAddressByGeopointUseCase>(() =>
        _i700.GetMyAddressByGeopointUseCase(
            gh<_i608.IGetAddressByGeopointService>()));
    gh.factory<_i608.IClientPointsService>(() =>
        _i222.FirebaseClientPointsService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.ITechnicalReviewSectionService>(() =>
        _i496.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IServiceDriverActionService>(() =>
        _i510.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IMarkAsViewedRequestServiceService>(() =>
        _i510.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IGetServiceCommonOffertsUseCase>(() =>
        _i878.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i608.IConsultServiceConfigurationService>()));
    gh.singleton<_i608.ILoginWithGoogleService>(
        () => _i716.LoginWithGoogleService(
              firebaseAuth: gh<_i59.FirebaseAuth>(),
              googleSignIn: gh<_i608.GoogleSignIn>(),
            ));
    gh.factory<_i608.ISendDriverRequestService>(() =>
        _i496.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.ITravelPointRepository>(
        () => _i477.SqfliteTravelPointRepository(gh<_i779.Database>()));
    gh.factory<_i608.ISaveAddressService>(() =>
        _i1043.SqfliteSaveAddressService(gh<_i608.ITravelPointRepository>()));
    gh.factory<_i608.IGetKnownAddressesService>(() =>
        _i1043.SqfliteGetKnownAddressesService(
            gh<_i608.ITravelPointRepository>()));
    gh.factory<_i608.IListenMyPointsUseCase>(
        () => _i187.ListenMyPointsUseCase(gh<_i608.IClientPointsService>()));
    gh.factory<_i608.IAboutCarSectionService>(() =>
        _i496.FirebaseAboutCarSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IAuthenticationService>(
        () => _i716.FirebaseAuthService(firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i608.IAcceptRequestServiceUseCase>(() =>
        _i878.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.IGetMyPointsUseCase>(
        () => _i187.GetMyPointsUseCase(gh<_i608.IClientPointsService>()));
    gh.factory<_i608.IClientBonusService>(() =>
        _i906.FirebaseClientbonusService(
          firebaseFirestore: gh<_i608.FirebaseFirestore>(),
          clientPointsService: gh<_i608.IClientPointsService>(),
          configurationService: gh<_i608.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i608.IDriverBalanceService>(() =>
        _i222.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i697.ISendTechnicalReviewSectionUseCase>(
        () => _i430.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i697.ITechnicalReviewSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IChatWithClientService>(
        () => _i815.ChatWithClientService(gh<_i608.IChatService>()));
    gh.factory<_i608.IUpdateProfileLocationDataUseCase>(() =>
        _i878.UpdateProfileLocationDataUseCase(
            profileService: gh<_i608.IProfileService>()));
    gh.factory<_i608.IGetUserUseCase>(() => _i377.GetUserUseCase(
          authenticationService: gh<_i608.IAuthenticationService>(),
          userRepository: gh<_i608.IUserRepository>(),
        ));
    gh.factory<_i608.ISendCounterOfferUseCase>(() =>
        _i878.SendCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i697.ISendOwnerShipCardSectionUseCase>(() =>
        _i430.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i697.IOwnerShipCardSectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i608.IPaymentRepository>(
        () => _i412.FirebasePaymentRepository(gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IFinishDriverRequestService>(() =>
        _i496.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i878.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i608.IAboutMeSectionService>(() =>
        _i496.FirebaseAboutMeSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IDriverLicenseSectionService>(() =>
        _i496.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.INoCriminalRecordSectionService>(() =>
        _i496.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i608.FirebaseFirestore>()));
    gh.factory<_i608.IAcceptCounterOfferUseCase>(() =>
        _i878.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IFindFileUseCase>(
        () => _i514.FindFileUseCase(gh<_i608.IFileSearchService>()));
    gh.factory<_i608.IListenDriverLocationUseCase>(() =>
        _i878.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i608.IGetDriverLocationService>()));
    gh.factory<_i608.IRegisterUseCase>(() => _i377.RegisterUseCase(
          userRepository: gh<_i608.IUserRepository>(),
          authenticationService: gh<_i608.IAuthenticationService>(),
        ));
    gh.factory<_i608.ISendRequestServiceUseCase>(
        () => _i878.SendRequestServiceUseCase(
              serviceActionService: gh<_i608.IServiceActionService>(),
              generateUuid: gh<_i608.IGenerateUuid>(),
            ));
    gh.factory<_i608.ISaveAddressUseCase>(
        () => _i700.SaveAddressUseCase(gh<_i608.ISaveAddressService>()));
    gh.factory<_i608.IChatWithClientUseCase>(() => _i878.ChatWithClientUseCase(
        chatWithClientService: gh<_i608.IChatWithClientService>()));
    gh.factory<_i608.IDriverPaymentService>(() =>
        _i906.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i608.FirebaseFirestore>(),
          driverBalanceService: gh<_i608.IDriverBalanceService>(),
          configurationService: gh<_i608.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i697.ISendNoCriminalRecordSectionUseCase>(
        () => _i430.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i697.INoCriminalRecordSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i697.ISendAboutCarSectionUseCase>(
        () => _i430.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i697.IAboutCarSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IGetAddressesByQueryUseCase>(() =>
        _i700.GetAddressesByQueryUseCase(
            gh<_i608.IGetAddressByQueryService>()));
    gh.factory<_i697.ISendDNISectionUseCase>(() => _i430.SendDNISectionUseCase(
          dniSectionService: gh<_i697.IDNISectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i608.ICallClientService>(
        () => _i343.CallClientService(gh<_i608.ICallService>()));
    gh.factory<_i608.IListenRequestServiceCounterOffersUseCase>(() =>
        _i878.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IFetchDriverRequestUseCase>(() =>
        _i47.FetchDriverRequestUseCase(
            driverRequestService: gh<_i608.IGetDriverRequestService>()));
    gh.factory<_i608.ICancelCounterOfferUseCase>(() =>
        _i878.CancelCounterOfferUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IMarkAsViewedRequestServiceUseCase>(() =>
        _i878.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i608.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i608.ILoginWithGoogleUseCase>(() =>
        _i377.LoginWithGoogleUseCase(gh<_i608.ILoginWithGoogleService>()));
    gh.factory<_i697.ISendDriverRequestUseCase>(
        () => _i430.SendDriverRequestUseCase(
              driverRequestService: gh<_i697.ISendDriverRequestService>(),
              userService: gh<_i697.IUserRepository>(),
            ));
    gh.factory<_i608.IListenCurrentRequestServiceUseCase>(() =>
        _i878.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceActionService>()));
    gh.factory<_i608.IGetKnownAddressesUseCase>(() =>
        _i700.GetKnownAddressesUseCase(gh<_i608.IGetKnownAddressesService>()));
    gh.factory<_i697.ISendAboutMeSectionUseCase>(
        () => _i430.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i697.IAboutMeSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IListenMyBalanceUseCase>(
        () => _i187.ListenMyBalanceUseCase(gh<_i608.IDriverBalanceService>()));
    gh.factory<_i608.IChangeRequestServiceOfferUseCase>(() =>
        _i878.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i608.IChangeRequestServiceOfferService>()));
    gh.factory<_i608.IPayRequestServiceWithPointsService>(
        () => _i179.FirebasePayRequestServiceWithPointsService(
              clientPointsService: gh<_i608.IClientPointsService>(),
              driverBalanceService: gh<_i608.IDriverBalanceService>(),
              consultServiceConfigurationService:
                  gh<_i608.IConsultServiceConfigurationService>(),
              firestore: gh<_i608.FirebaseFirestore>(),
            ));
    gh.factory<_i697.ISendSoatSectionUseCase>(
        () => _i430.SendSoatSectionUseCase(
              soatSectionService: gh<_i697.ISoatSectionService>(),
              userService: gh<_i697.IUserRepository>(),
              uploadFile: gh<_i697.IUploadFile>(),
            ));
    gh.factory<_i608.IListenAllRequestServiceUseCase>(() =>
        _i878.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i608.IServiceDriverActionService>()));
    gh.factory<_i697.IFinishDriverRequestUseCase>(
        () => _i430.FinishDriverRequestUseCase(
              driverRequestService: gh<_i697.IFinishDriverRequestService>(),
              userService: gh<_i697.IUserRepository>(),
            ));
    gh.factory<_i608.ILogoutUseCase>(
        () => _i377.LogoutUseCase(gh<_i608.IAuthenticationService>()));
    gh.factory<_i608.IServiceFinishDriverActionService>(
        () => _i510.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i608.FirebaseFirestore>(),
              clientBonusService: gh<_i608.IClientBonusService>(),
              driverPaymentService: gh<_i608.IDriverPaymentService>(),
            ));
    gh.factory<_i608.IGetPaymentsUseCase>(
        () => _i342.GetPaymentsUseCase(gh<_i608.IPaymentRepository>()));
    gh.factory<_i697.ISendDriverLicenseSectionUseCase>(() =>
        _i430.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i697.IDriverLicenseSectionService>(),
          userService: gh<_i697.IUserRepository>(),
          uploadFile: gh<_i697.IUploadFile>(),
        ));
    gh.factory<_i608.ICallClientUseCase>(() => _i878.CallClientUseCase(
        callClientService: gh<_i608.ICallClientService>()));
    gh.factory<_i608.IPayRequestServiceWithPointsUseCase>(() =>
        _i878.PayRequestServiceWithPointsUseCase(
            payRequestServiceWithPointsService:
                gh<_i608.IPayRequestServiceWithPointsService>()));
    gh.factory<_i608.IFinishServiceDriverUseCase>(() =>
        _i878.FinishServiceDriverUseCase(
            serviceActionService:
                gh<_i608.IServiceFinishDriverActionService>()));
    return this;
  }
}

class _$FirebaseAppModule extends _i1048.FirebaseAppModule {}

class _$FirebaseAuthModule extends _i1048.FirebaseAuthModule {}

class _$FirestoreModule extends _i1048.FirestoreModule {}

class _$AppCheckModule extends _i1048.AppCheckModule {}

class _$FirebaseStorageModule extends _i1048.FirebaseStorageModule {}

class _$GoogleSignInModule extends _i1048.GoogleSignInModule {}

class _$DioModule extends _i1048.DioModule {}

class _$DatabaseModule extends _i1048.DatabaseModule {}

class _$AudioPlayerModule extends _i1048.AudioPlayerModule {}

class _$FlutterLocalNotificationModule
    extends _i1048.FlutterLocalNotificationModule {}
