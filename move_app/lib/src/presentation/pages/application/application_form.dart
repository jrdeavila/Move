import 'package:move_app/lib.dart';

class ApplicationForm extends GetView<DriverRequestRegisterCtrl> {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
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
