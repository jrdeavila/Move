import 'package:flutter/services.dart';
import 'package:move_app/lib.dart';

class AboutCar extends GetView<AboutCarCtrl> {
  const AboutCar({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerCarPlate = TextEditingController();
    final controllerCarBrand = TextEditingController();
    final controllerCarModel = TextEditingController();

    controllerCarBrand.addListener(() {
      controller.setCarBrand(controllerCarBrand.text);
    });
    controllerCarPlate.addListener(() {
      controller.setCarPlate(controllerCarPlate.text);
    });
    controllerCarModel.addListener(() {
      controller.setCarModel(controllerCarModel.text);
    });

    Future.delayed(Duration.zero, () async {
      controllerCarPlate.text = controller.carPlate;
      controllerCarBrand.text = controller.carBrand;
      controllerCarModel.text = controller.carModel;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre el Vehiculo'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Foto del vehiculo",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ImagePicker(
                      image: controller.carFront,
                      onImageSelected: (image) {
                        controller.setCarFront(image);
                      },
                    ),
                  ),
                  InputClassic(
                    labelText: 'Marca',
                    controller: controllerCarBrand,
                    isPassword: false,
                    isNumericKeyboard: false,
                    isDateInput: false,
                    error: controller.errorCarBrand,
                  ),
                  InputClassic(
                    labelText: 'Modelo',
                    controller: controllerCarModel,
                    isPassword: false,
                    isNumericKeyboard: false,
                    isDateInput: false,
                    error: controller.errorCarModel,
                  ),
                  InputClassic(
                    labelText: 'Numero de placa',
                    controller: controllerCarPlate,
                    isPassword: false,
                    isNumericKeyboard: false,
                    isDateInput: false,
                    error: controller.errorCarPlate,
                    formatters: [
                      FilteringTextInputFormatter.allow(RegExp('[A-Z0-9]')),
                      LengthLimitingTextInputFormatter(6),
                    ],
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: Obx(
        () => controller.isValid
            ? FloatingActionButton.extended(
                onPressed: () {
                  controller.save();
                },
                label: controller.isLoading
                    ? Text("Guardando...",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                        ))
                    : Text("Guardar",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                        )),
                icon: controller.isLoading
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.save, color: Colors.white),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
