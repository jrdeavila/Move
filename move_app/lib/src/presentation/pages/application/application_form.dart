import 'package:move_app/lib.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerBirthDate = TextEditingController();
  TextEditingController controllerDriverLicense = TextEditingController();
  TextEditingController controllerDriverLicenseConfirmation =
      TextEditingController();
  TextEditingController controllerDriverLicenseExpirationDate =
      TextEditingController();
  TextEditingController controllerCarBrand = TextEditingController();
  TextEditingController controllerCarPlate = TextEditingController();
  bool showInformationDNI = false;
  bool showPersonalInformation = false;
  bool showInformationDriverLicense = false;
  bool showAbourCar = false;
  int currentStep = 0;

  void toggleInformationDNI() {
    setState(() {
      showInformationDNI = !showInformationDNI;
    });
  }

  void togglePersonalInformation() {
    setState(() {
      showPersonalInformation = !showPersonalInformation;
    });
  }

  void toggleInformationDriverLicense() {
    setState(() {
      showInformationDriverLicense = !showInformationDriverLicense;
    });
  }

  void toggleAboutCar() {
    setState(() {
      showAbourCar = !showAbourCar;
    });
  }

  void onStepContinue() {
    setState(() {
      if (currentStep < 1) {
        currentStep++;
      } else {
        Get.offAll(() => const InformativeMessage(
              isSucess: true,
              title: 'Registro Exitoso',
              description:
                  'La empresa revisará la información proporcionada y te informaremos sobre nuestra decisión.',
            ));
      }
    });
  }

  void onStepCancel() {
    setState(() {
      currentStep = (currentStep - 1).clamp(0, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(
            state: currentStep <= 0 ? StepState.editing : StepState.complete,
            title: const Text(''),
            isActive: currentStep == 0,
            content: Column(
              children: [
                if (!showInformationDriverLicense && !showPersonalInformation)
                  InputDownload(
                    title: 'CC',
                    root: 'assets/images/cc.png',
                    onPressed: toggleInformationDNI,
                    width: 80,
                    height: 70,
                  ),
                showInformationDNI
                    ? PersonalData(
                        controllerFirstName: controllerFirstName,
                        controllerLastName: controllerLastName,
                        controllerEmail: controllerEmail,
                        controllerBirthDate: controllerBirthDate)
                    : const SizedBox(),
                if (!showInformationDNI && !showInformationDriverLicense)
                  InputDownload(
                    title: 'Datos personales',
                    root: 'assets/images/photo.png',
                    onPressed: togglePersonalInformation,
                    width: 70,
                    height: 70,
                  ),
                showPersonalInformation
                    ? PersonalData(
                        controllerFirstName: controllerFirstName,
                        controllerLastName: controllerLastName,
                        controllerEmail: controllerEmail,
                        controllerBirthDate: controllerBirthDate)
                    : const SizedBox(),
                if (!showInformationDNI && !showPersonalInformation)
                  InputDownload(
                    title: 'Licencia de conducir',
                    root: 'assets/images/driving_license.png',
                    onPressed: toggleInformationDriverLicense,
                    width: 80,
                    height: 70,
                  ),
                showInformationDriverLicense
                    ? DriverLicense(
                        controllerDriverLicense: controllerDriverLicense,
                        controllerDriverLicenseConfirmation:
                            controllerDriverLicenseConfirmation,
                        controllerDriverLicenseExpirationDate:
                            controllerDriverLicenseExpirationDate,
                      )
                    : const SizedBox(),
                if (!showInformationDNI &&
                    !showInformationDriverLicense &&
                    !showPersonalInformation)
                  InputDownload(
                    title: 'Antecedentes penales',
                    root: 'assets/images/criminal_record.png',
                    onPressed: () {},
                    width: 80,
                    height: 80,
                  ),
              ],
            ),
          ),
          Step(
            state: currentStep <= 1 ? StepState.editing : StepState.complete,
            title: const Text(''),
            isActive: currentStep == 1,
            content: Column(
              children: [
                InputDownload(
                  title: 'Tarjeta de propiedad',
                  root: 'assets/images/property_card.png',
                  onPressed: toggleAboutCar,
                  width: 95,
                  height: 70,
                ),
                showAbourCar
                    ? AboutCar(
                        controllerCarPlate: controllerCarPlate,
                        controllerCarBrand: controllerCarBrand)
                    : const SizedBox(),
                if (!showAbourCar)
                  InputDownload(
                    title: 'SOAT',
                    root: 'assets/images/soat.png',
                    onPressed: () {},
                    width: 70,
                    height: 60,
                  ),
                if (!showAbourCar)
                  InputDownload(
                    title: 'Tecnomecanica',
                    root: 'assets/images/technomechanical.png',
                    onPressed: () {},
                    width: 80,
                    height: 70,
                  ),
                if (!showAbourCar)
                  InputDownload(
                    title: 'Foto',
                    root: 'assets/images/photo_car.png',
                    onPressed: () {},
                    width: 75,
                    height: 90,
                  ),
              ],
            ),
          ),
        ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const DashboardClient());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.07),
          child: Text('Registro conductor',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenWidth * 0.04,
            vertical: Dimensions.screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: Colors.white,
                  canvasColor: Colors.white,
                ),
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: currentStep,
                  onStepContinue: onStepContinue,
                  onStepCancel: onStepCancel,
                  controlsBuilder: (context, controller) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: Dimensions.screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonSmall(
                            text: 'Anterior',
                            onPressed: onStepCancel,
                            color: Colors.white,
                            colorText: Colors.grey,
                          ),
                          ButtonSmall(
                            text: 'Siguiente',
                            onPressed: onStepContinue,
                            color: Colors.amber,
                            colorText: Colors.white,
                          )
                        ],
                      ),
                    );
                  },
                  elevation: 0.0,
                  steps: stepList(),
                  onStepTapped: (int index) {
                    setState(() => currentStep = index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
