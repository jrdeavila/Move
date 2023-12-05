import 'package:move_app/lib.dart';

class ServiceDetailsView extends GetView<ListenCurrentServiceCtrl> {
  const ServiceDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
        child: Container(
      height: Dimensions.screenHeight * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              offset: Offset(0, -4),
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.screenHeight * 0.035,
              bottom: Dimensions.screenHeight * 0.02,
            ),
            child: Text(
              'Espera a que un conductor acepte tu servicio',
              style: GoogleFonts.montserrat(
                color: Colors.grey[600],
                fontSize: Dimensions.screenWidth * 0.06,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return CardActionButton(
                  color: Colors.blueAccent,
                  text: "- 500",
                  disabled: controller.enableDecrementOffer500,
                  onPressed: () {
                    controller.decrementOffer500();
                  },
                );
              }),
              const SizedBox(
                width: 20,
              ),
              Obx(() {
                return Text(
                    doubleCurrencyFormatter(
                      controller.currentOffer,
                    ),
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: Dimensions.screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ));
              }),
              const SizedBox(
                width: 10,
              ),
              CardActionButton(
                color: Colors.blueAccent,
                text: "+ 500",
                onPressed: () {
                  controller.incrementOffer500();
                },
              ),
            ],
          ),
          CardDetails(
            color: Colors.blue,
            adress: controller.currentRequestService?.origin.address ??
                'Dirección de origen',
            title: 'Origen',
          ),
          CardDetails(
            color: const Color.fromRGBO(255, 198, 65, 1),
            adress: controller.currentRequestService?.destination.address ??
                'Dirección de destino',
            title: 'Destino',
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.1,
                right: Dimensions.screenWidth * 0.1,
                top: Dimensions.screenHeight * 0.01),
            child: Obx(() {
              if (controller.onUpdatingCurrentOffer) {
                return ButtonClassic(
                  text: "Cambiar oferta",
                  onPressed: () {
                    controller.changeOffer();
                  },
                  color: Colors.blueAccent,
                );
              }
              return ButtonClassic(
                text: "Cancelar",
                onPressed: () {
                  controller.cancelRequestService();
                },
                color: const Color.fromRGBO(224, 26, 25, 1),
              );
            }),
          ),
        ],
      ),
    ));
  }
}
