import 'package:move_app/lib.dart';

class FormRequestService extends GetView<RequestServiceCtrl> {
  const FormRequestService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20.0,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("¿A DÓNDE VAMOS?",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(height: 20.0),
            Obx(() => AddressField(
                  color: Colors.blue,
                  name: controller.beginTravelPoint?.name ?? 'Recogida',
                  address: controller.beginTravelPoint?.address ??
                      'Dirección de recogida',
                  onTap: () {
                    controller.onEditingBeginAddress();
                    controller.openSearchAddress(context);
                  },
                )),
            const SizedBox(height: 10.0),
            Obx(() => AddressField(
                  color: Colors.redAccent,
                  name: controller.endTravelPoint?.name ?? 'Llegada',
                  address: controller.endTravelPoint?.address ??
                      'Dirección de llegada',
                  onTap: () {
                    controller.onEditingEndAddress();
                    controller.openSearchAddress(context);
                  },
                )),
            const SizedBox(height: 10.0),
            FeeButton(onTap: () {
              controller.openSetTee(context);
            }),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ButtonClassic(
                text: "Solicitar servicio",
                onPressed: () {
                  controller.requestService(context);
                },
                color: Get.theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
