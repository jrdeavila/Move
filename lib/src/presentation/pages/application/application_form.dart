import 'package:mevo/lib.dart';

class ApplicationForm extends GetView<DriverRequestRegisterCtrl> {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<DriverRequestRegisterCtrl>();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Registro conductor')),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenWidth * 0.04,
              vertical: Dimensions.screenHeight * 0.03),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...controller.steps.map((e) => _Step(
                          key: Key(e.title),
                          title: e.title,
                          status: e.status,
                          onTap: () => e.onTap(),
                        ))
                  ],
                )),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.screenWidth * 0.04,
              vertical: Dimensions.screenHeight * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() => ButtonClassic(
                    color: controller.isComplete
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[300]!,
                    text: 'Enviar solicitud',
                    onPressed: () {
                      if (controller.isComplete) {
                        controller.sendRequest();
                      }
                    },
                  )),
              const SizedBox(height: 10),
              Text(
                'Al enviar la solicitud, aceptas los términos y condiciones de uso.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.03,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
              TextButton(
                onPressed: () {
                  controller.showTermsAndConditions();
                },
                child: Text(
                  'Ver términos y condiciones',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Dimensions.screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required Key key,
    required this.title,
    required this.onTap,
    this.status = StepStatus.making,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final StepStatus status;

  Widget _buildStatus() {
    switch (status) {
      case StepStatus.making:
        return const Icon(Icons.circle_outlined, color: Colors.black, size: 20);
      case StepStatus.complete:
        return const Icon(Icons.check_circle, color: Colors.green, size: 20);
      case StepStatus.rejected:
        return const Icon(Icons.error, color: Colors.red, size: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.screenHeight * 0.02),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.screenWidth * 0.04,
            vertical: Dimensions.screenHeight * 0.02),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                )),
            _buildStatus(),
          ],
        ),
      ),
    );
  }
}
