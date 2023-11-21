import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/pages/dashboard/admin/dashboard_admin.dart';

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
                      //Get.to(() => const RequestService());
                      Get.to(() => const DashboardAdmin());
                    },
                    width: 96,
                    height: 80,
                    top: Dimensions.screenHeight * 0.095,
                    left: Dimensions.screenWidth * 0.59,
                  ),
                  CardCompound(
                    title: 'Modo',
                    secondTitle: 'Conductor',
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/steering.png',
                    onPressed: () {
                      Get.put(DriverRequestRegisterCtrl());
                      Get.toNamed(DriverRequestRoutes.driverMode);
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
                    size: Dimensions.screenWidth * 0.12,
                    width: 100,
                    height: 100,
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
