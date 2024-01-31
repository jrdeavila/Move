import 'package:mevo/lib.dart';

class ServiceDetailsView extends GetView<ListenCurrentServiceCtrl> {
  const ServiceDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              fontSize: 18,
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
                    size: 40,
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
                      fontSize: 35,
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
                    size: 40,
                  ),
                ),
              ],
            );
          }),
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
