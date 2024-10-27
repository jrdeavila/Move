import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:mevo/lib.dart';
import 'package:flutter/widgets.dart'; // Necesario para AppLifecycleState

const lyfeTimeOfRequestService = 15;

class ShowListServiceCtrl extends GetxController with WidgetsBindingObserver {
  final AppUser user;

  ShowListServiceCtrl({required this.user});

  final RxList<RequestService> _listRequestService = <RequestService>[].obs;
  final RxList<ServiceCommonOffer> _listServiceCommonOffert =
      <ServiceCommonOffer>[].obs;
  final RxDouble _currentOffert = 0.0.obs;

  List<RequestService> get listRequestService => _listRequestService;
  List<ServiceCommonOffer> get listServiceCommonOffert =>
      _listServiceCommonOffert;
  double get currentOffert => _currentOffert.value;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(
        this); // Añadir observador para los cambios de ciclo de vida
  }

  @override
  void onReady() {
    super.onReady();

    // Escuchamos los cambios en la lista de solicitudes
    ever(_listRequestService, (List<RequestService> listRequestService) {
      if (listRequestService.isNotEmpty) {
        _handleNewServiceRequest();
      }
    });

    // Iniciamos la escucha de solicitudes de servicio
    _listenRequestService();
  }

  @override
  void onClose() {
    WidgetsBinding.instance
        .removeObserver(this); // Remover el observador al cerrar
    _listRequestService.clear();
    super.onClose();
  }

  // Detecta cambios en el estado del ciclo de vida de la aplicación
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _notifyInBackground();
      _showOverlayWindow(); // Muestra la ventana superpuesta cuando está en segundo plano
    } else if (state == AppLifecycleState.resumed) {
      FlutterOverlayWindow
          .closeOverlay(); // Cierra la ventana superpuesta al volver al primer plano
    }
  }

  // Muestra una ventana superpuesta con contenido personalizado
  void _showOverlayWindow() async {
    // Verifica si el permiso está concedido, si no lo está, lo solicita.
    if (await FlutterOverlayWindow.isPermissionGranted()) {
      // Muestra la ventana superpuesta con el contenido personalizado
      FlutterOverlayWindow.showOverlay(
        height: 200,
        width: 300,
        enableDrag: true, // Permite mover la ventana
        alignment: OverlayAlignment.center,
        overlayContent:
            'Nueva solicitud de servicio', // Contenido que aparecerá en la ventana
      );
    } else {
      // Solicita el permiso si no está concedido
      await FlutterOverlayWindow.requestPermission();
    }
  }

  // Notificaciones en segundo plano cuando la aplicación está pausada
  void _notifyInBackground() {
    Get.find<NotificationCtrl>().showNotification(
      title: 'Nueva solicitud de servicio',
      body: 'Tienes una nueva solicitud de servicio',
    );
  }

  // Manejo de nueva solicitud de servicio: reproducir sonido, notificación y navegación
  void _handleNewServiceRequest() {
    _playSound();
    _routing();
  }

  // Redirige al conductor a la pantalla de servicios si hay nuevas solicitudes
  void _routing() {
    Get.toNamed(ProfileRoutes.showServices);
  }

  // Reproduce un sonido cuando hay una nueva solicitud
  void _playSound() {
    Get.find<SoundCtrl>().playSound();
  }

  // Escucha las solicitudes de servicio en tiempo real
  void _listenRequestService() {
    final useCase = getIt<IListenAllRequestServiceUseCase>();

    useCase.listen(ListenAllRequestServiceRequest(driver: user)).listen(
      (event) {
        _listRequestService.value = event;
        _listRequestService.refresh();
      },
      onError: (error) {
        Get.find<NotificationCtrl>().showNotification(
          title: 'Error de conexión',
          body: 'No se pudo obtener las solicitudes de servicio',
        );
      },
    );
  }

  // Obtiene ofertas comunes de servicio basadas en el valor de la oferta
  void _fetchServiceCommonOffert(double value) {
    final useCase = getIt<IGetServiceCommonOffertsUseCase>();
    useCase.get(GetServiceCommonOffertsRequest(price: value)).then((value) {
      _listServiceCommonOffert.value = value;
    });
  }

  // Muestra el modal para que el conductor envíe una contraoferta
  void showContraOffertModal(RequestService requestService) {
    _currentOffert.value = requestService.tee;
    _fetchServiceCommonOffert(requestService.tee);

    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CounterOffertModal(requestService: requestService);
      },
    );
  }

  // Envía una oferta común seleccionada por el conductor
  void onSelectCommonOffert(ServiceCommonOffer serviceCommonOffert,
      RequestService requestService) async {
    final useCase = getIt<ISendCounterOfferUseCase>();

    await useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: serviceCommonOffert.offer,
      ),
    );

    Get.find<BannerCtrl>().showInfo(
        'Oferta Enviada! 🎉', 'Espera a que el cliente acepte tu oferta');
  }

  // Cambia el valor de la oferta actual
  void onChangeOffert(double value) {
    _currentOffert.value = value;
  }

  // Envía una contraoferta personalizada basada en el valor actual
  void sendCounterOffert(RequestService requestService) async {
    _currentOffert.value = requestService.tee;

    final useCase = getIt<ISendCounterOfferUseCase>();

    await useCase.sendCounterOffer(
      SendCounterOfferRequest(
        driver: user,
        requestService: requestService,
        counterOffer: _currentOffert.value,
      ),
    );

    Get.find<BannerCtrl>()
        .showInfo('Genial! 🎉', 'Espera a que el cliente acepte tu servicio');
  }

  // Marca una solicitud de servicio como vista
  void removeRequestService(RequestService requestService) {
    final useCase = getIt<IMarkAsViewedRequestServiceUseCase>();

    useCase.markAsViewed(
      MarkAsViewedRequest(
        driver: user,
        requestService: requestService,
      ),
    );
  }
}
