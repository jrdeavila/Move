import 'package:audioplayers/audioplayers.dart';
import 'package:move_app/lib.dart';

class ShowListServiceCtrl extends GetxController {
  // ---------------------------- Final Variables ----------------------------
  final AppUser user;

  // ---------------------------- Constructor ----------------------------

  ShowListServiceCtrl({
    required this.user,
  });

  // ---------------------------- Observables ----------------------------

  final RxList<RequestService> _listRequestService = <RequestService>[].obs;

  // ---------------------------- Getters ----------------------------

  List<RequestService> get listRequestService => _listRequestService;

  // ---------------------------- Setters ----------------------------

  // ---------------------------- Lyfecycles ----------------------------

  @override
  void onReady() {
    super.onReady();
    ever(_listRequestService, _playSound);
    ever(_listRequestService, _routing);
    _listenRequestService();
  }

  // ---------------------------- Private Methods -----------------------------

  void _routing(List<RequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      // Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(ProfileRoutes.showServices);
      // });
    }
  }

  void _playSound(List<RequestService> listRequestService) {
    if (listRequestService.isNotEmpty) {
      final audioPlayerService = getIt<IPlaySound>();
      audioPlayerService(
        PlaySoundRequest(
          source: AssetSource('sounds/new-service.mp3'),
        ),
      );
    }
  }

  void _listenRequestService() {
    final useCase = getIt<IListenAllRequestServiceUseCase>();
    _listRequestService.bindStream(useCase.listen(
      ListenAllRequestServiceRequest(
        driver: user,
      ),
    ));
  }

  // ---------------------------- Public Methods -----------------------------

  void acceptService(RequestService requestService) {
    final useCase = getIt<IAcceptRequestServiceUseCase>();
    useCase.acceptRequestService(
      AcceptRequestServiceRequest(
        driver: user,
        requestService: requestService,
      ),
    );
  }

  void showContraOffertModal(RequestService requestService) {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return ContraOffertModal(
            requestService: requestService,
          );
        });
  }
}

class ContraOffertModal extends StatelessWidget {
  const ContraOffertModal({
    super.key,
    required this.requestService,
  });

  final RequestService requestService;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tarifa a ofertar",
            style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          CurrencyTextInputModal(
            onChanged: (value) {
              print(value);
            },
            initialValue: requestService.tee,
          ),
          const SizedBox(height: 10.0),
          Text(
            "Estas tarifas son sugeridas por la aplicación",
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20.0),
          LayoutBuilder(builder: (context, constraints) {
            return Wrap(
              spacing: constraints.maxWidth * 0.05,
              runSpacing: constraints.maxWidth * 0.03,
              children: [
                ...List.generate(
                    5,
                    (index) => Container(
                          width: constraints.maxWidth * 0.3,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Get.theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            doubleCurrencyFormatterWithoutSign(12000),
                            style: GoogleFonts.montserrat(
                              fontSize: constraints.maxWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))
              ],
            );
          }),
          const Spacer(),
          ButtonClassic(
            text: "Aceptar",
            onPressed: () {
              Get.back();
            },
            color: Get.theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
