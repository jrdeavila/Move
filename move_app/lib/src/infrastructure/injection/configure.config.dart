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
import '../../application/use_cases/authentication_use_case.dart' as _i25;
import '../../application/use_cases/bonification_use_case.dart' as _i24;
import '../../application/use_cases/driver_request_use_cases.dart' as _i36;
import '../../application/use_cases/fetch_driver_request_use_cases.dart'
    as _i34;
import '../../application/use_cases/find_address_use_cases.dart' as _i23;
import '../../application/use_cases/find_file_use_cases.dart' as _i20;
import '../../application/use_cases/profile_use_case.dart' as _i39;
import '../../application/use_cases/request_service_use_case.dart' as _i38;
import '../../application/use_cases/service_action_use_cases.dart' as _i14;
import '../../src.dart' as _i35;
import '../device/services/find_file.dart' as _i19;
import '../device/services/play_sound.dart' as _i28;
import '../device/services/url_launcher_call_service.dart' as _i12;
import '../device/services/whatsapp_chat_message.dart' as _i15;
import '../domain/services/call_client_service.dart' as _i33;
import '../domain/services/chat_client_service.dart' as _i16;
import '../firebase/repositories/firebase_payment_repository.dart' as _i27;
import '../firebase/repositories/firebase_user_repository.dart' as _i32;
import '../firebase/services/firebase_auth_service.dart' as _i11;
import '../firebase/services/firebase_driver_request_service.dart' as _i10;
import '../firebase/services/firebase_finish_service_actions_service.dart'
    as _i18;
import '../firebase/services/firebase_profile_service.dart' as _i29;
import '../firebase/services/firebase_service_action_service.dart' as _i13;
import '../firebase/services/firebase_service_driver_action_service.dart'
    as _i26;
import '../firebase/services/firebase_upload_file_service.dart' as _i31;
import '../firebase/services/firebase_user_bonification_service.dart' as _i17;
import '../google/services/google_find_address_service.dart' as _i22;
import '../sqflite/repositories/sqflite_travel_point_repository.dart' as _i30;
import '../sqflite/services/find_known_address_service.dart' as _i37;
import '../uuid/generate_uuid_service.dart' as _i21;
import 'dependecies.dart' as _i40;

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
    gh.lazySingleton<_i9.ICallService>(() => _i12.UrlLauncherCallService());
    gh.factory<_i9.IChangeRequestServiceOfferService>(() =>
        _i13.FirebaseChangeRequestServiceOfferService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IChangeRequestServiceOfferUseCase>(() =>
        _i14.ChangeRequestServiceOfferUseCase(
            changeRequestServiceOfferService:
                gh<_i9.IChangeRequestServiceOfferService>()));
    gh.lazySingleton<_i9.IChatService>(() => _i15.WhatsappChatMessageService());
    gh.factory<_i9.IChatWithClientService>(
        () => _i16.ChatWithClientService(gh<_i9.IChatService>()));
    gh.factory<_i9.IChatWithClientUseCase>(() => _i14.ChatWithClientUseCase(
        chatWithClientService: gh<_i9.IChatWithClientService>()));
    gh.factory<_i9.IClientPointsService>(() => _i17.FirebaseClientPointsService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IConsultServiceConfigurationService>(() =>
        _i18.FirebaseConsultServiceConfigurationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDNISectionService>(() => _i10.FirebaseDNISectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverBalanceService>(() =>
        _i17.FirebaseDriverBalanceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverLicenseSectionService>(() =>
        _i10.FirebaseDriverLicenseSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IDriverPaymentService>(() =>
        _i18.FirebaseDriverPaymentService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          driverBalanceService: gh<_i9.IDriverBalanceService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFileSearchService>(() => _i19.FindFileService());
    gh.factory<_i9.IFindFileUseCase>(
        () => _i20.FindFileUseCase(gh<_i9.IFileSearchService>()));
    gh.factory<_i9.IFinishDriverRequestService>(() =>
        _i10.FirebaseFinishDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGenerateUuid>(() => _i21.GenerateUuidService());
    gh.factory<_i9.IGetAddressByGeopointService>(
        () => _i22.GoogleGetAddressByGeopointService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressByGeopointUseCase>(() =>
        _i23.GetMyAddressByGeopointUseCase(
            gh<_i9.IGetAddressByGeopointService>()));
    gh.factory<_i9.IGetAddressByQueryService>(
        () => _i22.GoogleFindAddressService(gh<_i5.Dio>()));
    gh.factory<_i9.IGetAddressesByQueryUseCase>(() =>
        _i23.GetAddressesByQueryUseCase(gh<_i9.IGetAddressByQueryService>()));
    gh.factory<_i9.IGetDriverLocationService>(() =>
        _i13.FirebaseGetDriverLocationService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetDriverRequestService>(() =>
        _i10.FirebaseGetDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IGetMyPointsUseCase>(
        () => _i24.GetMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.factory<_i9.IGetServiceCommonOffertsUseCase>(() =>
        _i14.GetServiceCommonOffertsUseCase(
            configurationService:
                gh<_i9.IConsultServiceConfigurationService>()));
    gh.factory<_i9.IListenDriverLocationUseCase>(() =>
        _i14.ListenDriverLocationUseCase(
            getDriverLocationService: gh<_i9.IGetDriverLocationService>()));
    gh.factory<_i9.IListenMyBalanceUseCase>(
        () => _i24.ListenMyBalanceUseCase(gh<_i9.IDriverBalanceService>()));
    gh.factory<_i9.IListenMyPointsUseCase>(
        () => _i24.ListenMyPointsUseCase(gh<_i9.IClientPointsService>()));
    gh.factory<_i9.ILogoutUseCase>(
        () => _i25.LogoutUseCase(gh<_i9.IAuthenticationService>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceService>(() =>
        _i26.FirebaseMarkAsViewedRequestServiceService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IMarkAsViewedRequestServiceUseCase>(() =>
        _i14.MarkAsViewedRequestServiceUseCase(
            markAsViewedRequestServiceService:
                gh<_i9.IMarkAsViewedRequestServiceService>()));
    gh.factory<_i9.INoCriminalRecordSectionService>(() =>
        _i10.FirebaseNoCriminalRecordSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IOwnerShipCardSectionService>(() =>
        _i10.FirebaseOwnerShipSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPaymentRepository>(
        () => _i27.FirebasePaymentRepository(gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IPlaySound>(() => _i28.AudioPlayerPlaySound());
    gh.factory<_i9.IProfileService>(() =>
        _i29.FirebaseProfileService(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISendDriverRequestService>(() =>
        _i10.FirebaseSendDriverRequestService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceActionService>(() =>
        _i13.FirebaseServiceActionService(
            firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IServiceDriverActionService>(() =>
        _i26.FirebaseServiceDriverActionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ISoatSectionService>(() => _i10.FirebaseSoatSectionService(
        firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITechnicalReviewSectionService>(() =>
        _i10.FirebaseTechnicalReviewSectionService(
            firebaseFirestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.ITravelPointRepository>(
        () => _i30.SqfliteTravelPointRepository(gh<_i4.Database>()));
    gh.factory<_i9.IUpdateProfileLocationDataUseCase>(() =>
        _i14.UpdateProfileLocationDataUseCase(
            profileService: gh<_i9.IProfileService>()));
    gh.factory<_i9.IUploadFile>(() => _i31.FirebaseUploadFileService(
        firebaseStorage: gh<_i9.FirebaseStorage>()));
    gh.factory<_i9.IUserRepository>(() =>
        _i32.FirebaseUserRepository(firestore: gh<_i9.FirebaseFirestore>()));
    gh.factory<_i9.IAcceptCounterOfferUseCase>(() =>
        _i14.AcceptCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IAcceptRequestServiceUseCase>(() =>
        _i14.AcceptRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.ICallClientService>(
        () => _i33.CallClientService(gh<_i9.ICallService>()));
    gh.factory<_i9.ICallClientUseCase>(() => _i14.CallClientUseCase(
        callClientService: gh<_i9.ICallClientService>()));
    gh.factory<_i9.ICancelCounterOfferUseCase>(() =>
        _i14.CancelCounterOfferUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.ICancelRequestServiceUseCase>(() =>
        _i14.CancelRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IClientBonificationService>(() =>
        _i18.FirebaseClientBonificationService(
          firebaseFirestore: gh<_i9.FirebaseFirestore>(),
          clientPointsService: gh<_i9.IClientPointsService>(),
          configurationService: gh<_i9.IConsultServiceConfigurationService>(),
        ));
    gh.factory<_i9.IFetchDriverRequestUseCase>(() =>
        _i34.FetchDriverRequestUseCase(
            driverRequestService: gh<_i9.IGetDriverRequestService>()));
    gh.factory<_i35.IFinishDriverRequestUseCase>(
        () => _i36.FinishDriverRequestUseCase(
              driverRequestService: gh<_i35.IFinishDriverRequestService>(),
              userService: gh<_i35.IUserRepository>(),
            ));
    gh.factory<_i9.IGetKnownAddressesService>(() =>
        _i37.SqfliteGetKnownAddressesService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.IGetKnownAddressesUseCase>(() =>
        _i23.GetKnownAddressesUseCase(gh<_i9.IGetKnownAddressesService>()));
    gh.factory<_i9.IGetPaymentsUseCase>(
        () => _i38.GetPaymentsUseCase(gh<_i9.IPaymentRepository>()));
    gh.factory<_i9.IGetUserUseCase>(() => _i25.GetUserUseCase(
          authenticationService: gh<_i9.IAuthenticationService>(),
          userRepository: gh<_i9.IUserRepository>(),
        ));
    gh.factory<_i9.IListenAllRequestServiceUseCase>(() =>
        _i14.ListenAllRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceDriverUseCase>(() =>
        _i14.ListenCurrentRequestServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i9.IListenCurrentRequestServiceUseCase>(() =>
        _i14.ListenCurrentRequestServiceUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.factory<_i9.IListenRequestServiceCounterOffersUseCase>(() =>
        _i14.ListenRequestServiceCounterOffersUseCase(
            serviceActionService: gh<_i9.IServiceActionService>()));
    gh.singleton<_i9.IPhoneAuthenticationService>(
        _i11.FirebasePhoneAuthenticationService(
      firebaseAuth: gh<_i8.FirebaseAuth>(),
      userRepository: gh<_i9.IUserRepository>(),
    ));
    gh.factory<_i9.IRegisterUseCase>(() => _i25.RegisterUseCase(
          userRepository: gh<_i9.IUserRepository>(),
          authenticationService: gh<_i9.IAuthenticationService>(),
        ));
    gh.factory<_i9.ISaveAddressService>(
        () => _i37.SqfliteSaveAddressService(gh<_i9.ITravelPointRepository>()));
    gh.factory<_i9.ISaveAddressUseCase>(
        () => _i23.SaveAddressUseCase(gh<_i9.ISaveAddressService>()));
    gh.factory<_i35.ISendAboutCarSectionUseCase>(
        () => _i36.SendAboutCarSectionUseCase(
              aboutCarSectionService: gh<_i35.IAboutCarSectionService>(),
              userService: gh<_i35.IUserRepository>(),
              uploadFile: gh<_i35.IUploadFile>(),
            ));
    gh.factory<_i35.ISendAboutMeSectionUseCase>(
        () => _i36.SendAboutMeSectionUseCase(
              aboutMeSectionService: gh<_i35.IAboutMeSectionService>(),
              userService: gh<_i35.IUserRepository>(),
              uploadFile: gh<_i35.IUploadFile>(),
            ));
    gh.factory<_i9.ISendCodeUseCase>(
        () => _i25.SendCodeUseCase(gh<_i9.IPhoneAuthenticationService>()));
    gh.factory<_i9.ISendCounterOfferUseCase>(() => _i14.SendCounterOfferUseCase(
        serviceActionService: gh<_i9.IServiceDriverActionService>()));
    gh.factory<_i35.ISendDNISectionUseCase>(() => _i36.SendDNISectionUseCase(
          dniSectionService: gh<_i35.IDNISectionService>(),
          userService: gh<_i35.IUserRepository>(),
          uploadFile: gh<_i35.IUploadFile>(),
        ));
    gh.factory<_i35.ISendDriverLicenseSectionUseCase>(() =>
        _i36.SendDriverLicenseSectionUseCase(
          driverLicenseSectionService: gh<_i35.IDriverLicenseSectionService>(),
          userService: gh<_i35.IUserRepository>(),
          uploadFile: gh<_i35.IUploadFile>(),
        ));
    gh.factory<_i35.ISendDriverRequestUseCase>(
        () => _i36.SendDriverRequestUseCase(
              driverRequestService: gh<_i35.ISendDriverRequestService>(),
              userService: gh<_i35.IUserRepository>(),
            ));
    gh.factory<_i35.ISendNoCriminalRecordSectionUseCase>(
        () => _i36.SendNoCriminalRecordSectionUseCase(
              noCriminalRecordSectionService:
                  gh<_i35.INoCriminalRecordSectionService>(),
              userService: gh<_i35.IUserRepository>(),
              uploadFile: gh<_i35.IUploadFile>(),
            ));
    gh.factory<_i35.ISendOwnerShipCardSectionUseCase>(() =>
        _i36.SendOwnerShipCardSectionUseCase(
          ownerShipCardSectionService: gh<_i35.IOwnerShipCardSectionService>(),
          userService: gh<_i35.IUserRepository>(),
          uploadFile: gh<_i35.IUploadFile>(),
        ));
    gh.factory<_i9.ISendRequestServiceUseCase>(
        () => _i14.SendRequestServiceUseCase(
              serviceActionService: gh<_i9.IServiceActionService>(),
              generateUuid: gh<_i9.IGenerateUuid>(),
            ));
    gh.factory<_i35.ISendSoatSectionUseCase>(() => _i36.SendSoatSectionUseCase(
          soatSectionService: gh<_i35.ISoatSectionService>(),
          userService: gh<_i35.IUserRepository>(),
          uploadFile: gh<_i35.IUploadFile>(),
        ));
    gh.factory<_i35.ISendTechnicalReviewSectionUseCase>(
        () => _i36.SendTechnicalReviewSectionUseCase(
              technicalReviewSectionService:
                  gh<_i35.ITechnicalReviewSectionService>(),
              userService: gh<_i35.IUserRepository>(),
              uploadFile: gh<_i35.IUploadFile>(),
            ));
    gh.factory<_i9.IServiceFinishDriverActionService>(
        () => _i26.FirebaseServiceFinishDriverActionService(
              firebaseFirestore: gh<_i9.FirebaseFirestore>(),
              clientBoniticationService: gh<_i9.IClientBonificationService>(),
              driverPaymentService: gh<_i9.IDriverPaymentService>(),
            ));
    gh.factory<_i9.IUpdateProfileUseCase>(() =>
        _i39.UpdateProfileUseCase(userRepository: gh<_i9.IUserRepository>()));
    gh.factory<_i9.IFinishServiceDriverUseCase>(() =>
        _i14.FinishServiceDriverUseCase(
            serviceActionService: gh<_i9.IServiceFinishDriverActionService>()));
    gh.factory<_i9.ILoginWithPhoneUseCase>(() =>
        _i25.LoginWithPhoneUseCase(gh<_i9.IPhoneAuthenticationService>()));
    return this;
  }
}

class _$AudioPlayerModule extends _i40.AudioPlayerModule {}

class _$DatabaseModule extends _i40.DatabaseModule {}

class _$DioModule extends _i40.DioModule {}

class _$FirebaseAppModule extends _i40.FirebaseAppModule {}

class _$AppCheckModule extends _i40.AppCheckModule {}

class _$FirebaseAuthModule extends _i40.FirebaseAuthModule {}

class _$FirestoreModule extends _i40.FirestoreModule {}

class _$FirebaseStorageModule extends _i40.FirebaseStorageModule {}
