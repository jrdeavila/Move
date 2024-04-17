import 'package:mevo/lib.dart';

class ServiceAccepted extends GetView<ListenCurrentServiceCtrl> {
  const ServiceAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Obx(() => UserProfile(
                    user:
                        "${controller.currentRequestService!.driver?.firstname}",
                    score: controller.currentRequestService!.driver?.rating!
                            .toStringAsPrecision(2) ??
                        "5.0",
                    colorText: Colors.black,
                  )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('El conductor llegara en 5 minutos',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(
                        '${controller.currentRequestService!.driver!.driver.carBrand} ${controller.currentRequestService!.driver!.driver.carModel}',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Dimensions.screenWidth * 0.26,
                          height: Dimensions.screenHeight * 0.035,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color.fromRGBO(140, 138, 142, 1),
                          ),
                          child: Center(
                            child: Text(
                                controller.currentRequestService!.driver!.driver
                                    .carPlate,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: Dimensions.screenWidth * 0.035,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                )),
                          ),
                        ),
                        Text(
                            doubleCurrencyFormatter(
                                controller.currentRequestService?.tee ?? 0),
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Obx(() => CardDetails(
                color: Colors.blue,
                adress: controller.currentRequestService?.origin.address ??
                    "Direccion de origen",
                title:
                    controller.currentRequestService?.origin.name ?? "Origen",
              )),
          Obx(() => CardDetails(
                color: const Color.fromRGBO(255, 198, 65, 1),
                adress: controller.currentRequestService?.destination.address ??
                    "Direccion de destino",
                title: controller.currentRequestService?.destination.name ??
                    "Destino",
              )),
          const SizedBox(height: 20.0),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ButtonClassic(
                    text: "Cancelar",
                    onPressed: () {
                      controller.cancelRequestService();
                    },
                    color: const Color.fromRGBO(224, 26, 25, 1),
                  ),
                ),
                if (controller.currentRequestService?.payment.type ==
                    PaymentType.points) ...[
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ButtonClassic(
                      text: "Pagar",
                      onPressed: () {
                        controller.payWithPoints();
                      },
                      color: Colors.blue,
                    ),
                  )
                ]
              ],
            );
          }),
        ],
      ),
    );
  }
}
