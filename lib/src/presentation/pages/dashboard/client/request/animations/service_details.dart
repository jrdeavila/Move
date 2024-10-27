import 'package:mevo/lib.dart';

class ServiceDetailsView extends GetView<ListenCurrentServiceCtrl> {
  const ServiceDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final minFontSize = MediaQuery.of(context).size.height * 0.02;
    final maxFontSize = MediaQuery.of(context).size.height * 0.035;
    final maxIconSize = MediaQuery.of(context).size.height * 0.04;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20.0,
              offset: const Offset(0, -5),
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Espere a que un conductor acepte su servicio',
            style: GoogleFonts.montserrat(
              color: Colors.grey[600],
              fontSize: minFontSize,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.decrementOffer500();
                  },
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.yellow[700],
                    size: maxIconSize,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                    doubleCurrencyFormatter(
                      controller.currentOffer,
                    ),
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: maxFontSize,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    controller.incrementOffer500();
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.yellow[700],
                    size: maxIconSize,
                  ),
                ),
              ],
            );
          }),
          Divider(
            color: Colors.grey[300],
            thickness: 1.0,
          ),
          CardDetails(
            color: Colors.blue,
            adress: controller.currentRequestService?.origin.address ??
                'Dirección de origen',
            title: controller.currentRequestService?.origin.name ?? 'Origen',
          ),
          CardDetails(
            color: Colors.redAccent,
            adress: controller.currentRequestService?.destination.address ??
                'Dirección de destino',
            title:
                controller.currentRequestService?.destination.name ?? 'Destino',
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1.0,
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
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
        ],
      ),
    );
  }
}
