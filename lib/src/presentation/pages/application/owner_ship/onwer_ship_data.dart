import 'package:flutter/services.dart';
import 'package:mevo/lib.dart';

class OwnerShipData extends GetView<OwnerShipCtrl> {
  const OwnerShipData({super.key});

  @override
  Widget build(BuildContext context) {
    final ownerShipNumber = TextEditingController();

    ownerShipNumber.addListener(() {
      controller.setYearOfExpiration(int.parse(ownerShipNumber.text));
    });

    Future.delayed(Duration.zero, () {
      ownerShipNumber.text =
          controller.ownerShipCardYearOfExpiration.toString();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tarjeta de propiedad'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputClassic(
                    labelText: 'Año de expiración',
                    controller: ownerShipNumber,
                    isPassword: false,
                    isNumericKeyboard: true,
                    isDateInput: false,
                    error: controller.errorOnwerShipNumber,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Frontal de la tarjeta de propiedad ${controller.errorOnwerShipNumber != null ? '(${controller.errorOnwerShipNumber})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorOnwerShipNumber != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.ownerShipCardFront,
                      onImageSelected: (image) {
                        controller.setFrontLicense(image);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Posterior de la tarjeta de propiedad ${controller.errorBackDNI != null ? '(${controller.errorBackDNI})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorBackDNI != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.ownerShipCardBack,
                      onImageSelected: (image) {
                        controller.setBackLicense(image);
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.isValid
            ? FloatingActionButton.extended(
                onPressed: () {
                  controller.save();
                },
                icon: controller.isLoading
                    ? const SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.save, color: Colors.white),
                label: controller.isLoading
                    ? const Text("Guardando...",
                        style: TextStyle(color: Colors.white))
                    : const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      ))
            : const SizedBox.shrink(),
      ),
    );
  }
}
