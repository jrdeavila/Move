import 'package:move_app/lib.dart';

class DashboardClient extends GetView<SessionCtrl> {
  const DashboardClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sort_rounded, color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    controller.logout();
                  },
                  icon: const Icon(Icons.output_rounded, color: Colors.black),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text('Bienvenido',
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: Dimensions.screenWidth * 0.06,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.2,
                      )),
                  Obx(() => Text("${controller.user?.firstname}",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: Dimensions.screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ))),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.screenHeight * 0.03,
                    ),
                    child: Text('panel de control',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        )),
                  ),
                  CardDescription(
                    title: 'Solicitar servicio',
                    color: const Color.fromRGBO(255, 198, 65, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/car.png',
                    description: '¿Necesitas un viaje? ¡Estamos en camino!',
                    onPressed: () {
                      Get.to(() => const RequestService());
                    },
                  ),
                  CardCompound(
                    title: 'Modo',
                    secondTitle: 'Conductor',
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/steering.png',
                    onPressed: () {
                      Get.toNamed(ProfileRoutes.driverMode);
                    },
                  ),
                  CardClassic(
                    title: 'Perfil',
                    color: Colors.black,
                    colorTitle: Colors.white,
                    root: 'assets/images/profile.png',
                    onPressed: () {
                      Get.toNamed(ProfileRoutes.profile);
                    },
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
