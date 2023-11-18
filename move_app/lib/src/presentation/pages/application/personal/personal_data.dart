import 'package:move_app/lib.dart';

class PersonalData extends GetView<AboutMeCtrl> {
  const PersonalData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controllerFirstName = TextEditingController();
    final controllerLastName = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerBirthDate = TextEditingController();

    controllerFirstName.addListener(() {
      controller.setFirstName(controllerFirstName.text);
    });
    controllerLastName.addListener(() {
      controller.setLastName(controllerLastName.text);
    });
    controllerEmail.addListener(() {
      controller.setEmail(controllerEmail.text);
    });
    controllerBirthDate.addListener(() {
      controller.setBirthDate(controllerBirthDate.text);
    });

    Future.delayed(Duration.zero, () {
      controllerFirstName.text = controller.getFirstName;
      controllerLastName.text = controller.getLastName;
      controllerEmail.text = controller.getEmail;
      controllerBirthDate.text = controller.getBirthDate;
    });

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Datos personales'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: ImagePicker(
                      image: controller.getPhoto,
                      onImageSelected: (image) {
                        controller.setPhoto(image);
                      },
                    )),
                const SizedBox(height: 20),
                InputClassic(
                  labelText: 'Primer Nombre',
                  controller: controllerFirstName,
                  isPassword: false,
                  isNumericKeyboard: false,
                  isDateInput: false,
                  error: controller.getFirstNameError,
                ),
                InputClassic(
                  labelText: 'Primer Apellido',
                  controller: controllerLastName,
                  isPassword: false,
                  isNumericKeyboard: false,
                  isDateInput: false,
                  error: controller.getLastNameError,
                ),
                InputClassic(
                  labelText: 'Correo',
                  controller: controllerEmail,
                  isPassword: false,
                  isNumericKeyboard: false,
                  isDateInput: false,
                  error: controller.getEmailError,
                ),
                InputClassic(
                  labelText: 'Fecha nacimiento',
                  controller: controllerBirthDate,
                  isPassword: false,
                  isNumericKeyboard: false,
                  isDateInput: true,
                  error: controller.getBirthDateError,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(() {
          if (controller.isValid) {
            return FloatingActionButton(
              onPressed: () {
                controller.save();
              },
              child: controller.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Icon(Icons.save, color: Colors.white),
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
