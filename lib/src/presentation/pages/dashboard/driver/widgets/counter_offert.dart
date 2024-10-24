import 'package:move_app/lib.dart';

class CounterOffertModal extends GetView<ShowListServiceCtrl> {
  const CounterOffertModal({
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
              controller.onChangeOffert(value.toDouble());
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
            return Obx(() {
              return Wrap(
                spacing: constraints.maxWidth * 0.05,
                runSpacing: constraints.maxWidth * 0.03,
                children: [
                  ...controller.listServiceCommonOffert.map((e) => OffertItem(
                        onTap: () {
                          controller.onSelectCommonOffert(e, requestService);
                          Get.back();
                        },
                        offert: e,
                        width: constraints.maxWidth * 0.3,
                      ))
                ],
              );
            });
          }),
          const Spacer(),
          ButtonClassic(
            text: "Aceptar",
            onPressed: () {
              controller.sendCounterOffert(requestService);
              Get.back();
            },
            color: Get.theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class OffertItem extends StatelessWidget {
  const OffertItem({
    super.key,
    required this.offert,
    required this.width,
    required this.onTap,
  });

  final ServiceCommonOffer offert;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          doubleCurrencyFormatterWithoutSign(offert.offer),
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
