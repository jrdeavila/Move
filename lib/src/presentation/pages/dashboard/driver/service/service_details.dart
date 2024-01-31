import 'package:mevo/lib.dart';

class ServiceDetailsDriver extends GetView<ListenDriverCurrentServiceCtrl> {
  const ServiceDetailsDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(child: Obx(() {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(0.0, -5.0),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          controller.currentRequestService?.clientCreator
                                  .firstname ??
                              'Nombre del cliente',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          )),
                      Text(
                          PhoneConvert.fromFirebase(
                              numberPhone: controller.currentRequestService
                                      ?.clientCreator.phone ??
                                  "+570000000000"),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          )),
                      Text(
                          controller.currentRequestService?.payment.name ??
                              'Efectivo',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: Dimensions.screenWidth * 0.043,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InteractButtonIcon(
                          icon: Icons.phone,
                          onTap: () {
                            controller.callClient();
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        InteractButtonIcon(
                          icon: Icons.chat,
                          onTap: () {
                            controller.chatWithClient();
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        doubleCurrencyFormatter(
                            controller.currentRequestService?.tee ?? 0),
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
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
            const Spacer(),
            ButtonClassic(
              text: "Finalizar",
              onPressed: () {
                controller.finishService();
              },
              color: const Color.fromRGBO(255, 198, 65, 1),
            ),
          ],
        ),
      );
    }));
  }
}

class InteractButtonIcon extends StatelessWidget {
  const InteractButtonIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
