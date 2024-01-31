import 'package:flutter/services.dart';
import 'package:mevo/lib.dart';

class DNIData extends GetView<DNICtrl> {
  const DNIData({super.key});

  @override
  Widget build(BuildContext context) {
    final dniNumberCtrl = TextEditingController();

    dniNumberCtrl.addListener(() {
      controller.setDniNumber(dniNumberCtrl.text);
    });

    Future.delayed(Duration.zero, () {
      dniNumberCtrl.text = controller.dniNumber;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Identificación'),
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
                    labelText: 'Número de indentificación',
                    controller: dniNumberCtrl,
                    isPassword: false,
                    isNumericKeyboard: true,
                    isDateInput: false,
                    error: controller.errorDniNumber,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Frontal de la identificacion ${controller.errorFrontDNI != null ? '(${controller.errorFrontDNI})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorFrontDNI != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.frontDNI,
                      onImageSelected: (image) {
                        controller.setFrontLicense(image);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Posterior de la identificacion ${controller.errorBackDNI != null ? '(${controller.errorBackDNI})' : ''}',
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
                      image: controller.backDNI,
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
