import 'package:mevo/lib.dart';

class Profiles extends GetView<DetailsCtrl> {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text('Perfil',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Dimensions.screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.screenHeight * 0.03),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Container(
                  width: Dimensions.screenWidth * 0.2,
                  height: Dimensions.screenHeight * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(67, 67, 67, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 193, 7, 1),
                      ),
                      Obx(() {
                        return Text(
                          controller.rating.toStringAsPrecision(2),
                          style: GoogleFonts.montserrat(
                            fontSize: Dimensions.screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        );
                      }),
                    ],
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.02,
              ),
              Obx(() => Text(controller.firstname,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ))),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Obx(() => Text(controller.email,
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(67, 67, 67, 1),
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ))),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              CustomButton(
                  text: 'Datos personales',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    Get.toNamed(ProfileRoutes.details);
                  }),
              Obx(() {
                if (controller.isDriver == true) {
                  return CustomButton(
                    text: 'Información del vehiculo',
                    icon: Icons.arrow_forward_ios_rounded,
                    onPressed: () {},
                  );
                }
                return const SizedBox.shrink();
              }),
              CustomButton(
                  text: 'Eliminar cuenta',
                  icon: Icons.delete_outline_outlined,
                  onPressed: () {
                    controller.deleteAccount();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
