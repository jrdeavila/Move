import 'package:flutter/services.dart';
import 'package:move_app/lib.dart';

class LicenseData extends GetView<LicenseCtrl> {
  const LicenseData({super.key});

  @override
  Widget build(BuildContext context) {
    final licenseNumberCtrl = TextEditingController();
    final dateExpirationCtrl = TextEditingController();

    licenseNumberCtrl.addListener(() {
      controller.setLicenseNumber(licenseNumberCtrl.text);
    });

    dateExpirationCtrl.addListener(() {
      controller.setDateExpiration(dateExpirationCtrl.text);
    });

    Future.delayed(Duration.zero, () async {
      licenseNumberCtrl.text = controller.licenseNumber;
      dateExpirationCtrl.text = controller.dateExpiration;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Licencia de conducir'),
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
                    labelText: 'Número de licencia',
                    controller: licenseNumberCtrl,
                    isPassword: false,
                    isNumericKeyboard: true,
                    isDateInput: false,
                    error: controller.errorLicenseNumber,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                  ),
                  InputClassic(
                    labelText: 'Fecha de expiración',
                    controller: dateExpirationCtrl,
                    isPassword: false,
                    isNumericKeyboard: false,
                    isDateInput: true,
                    error: controller.errorDateExpiration,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Frontal de la licencia ${controller.errorFrontLicense != null ? '(${controller.errorFrontLicense})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorFrontLicense != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.frontLicense,
                      onImageSelected: (image) {
                        controller.setFrontLicense(image);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Foto Posterior de la licencia ${controller.errorBackLicense != null ? '(${controller.errorBackLicense})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorBackLicense != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.backLicense,
                      onImageSelected: (image) {
                        controller.setBackLicense(image);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Confirmación de la licencia ${controller.errorConfirmLicense != null ? '(${controller.errorConfirmLicense})' : ''}',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.errorConfirmLicense != null
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  Text(
                    'Foto de la licencia donde se vea tu rostro y el número de licencia.',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.confirmLicense,
                      onImageSelected: (image) {
                        controller.setConfirmLicense(image);
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
      floatingActionButton: Obx(
        () => controller.isValid
            ? FloatingActionButton(
                onPressed: () {
                  controller.save();
                },
                child: controller.isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Icon(Icons.keyboard_double_arrow_right,
                        color: Colors.white),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
