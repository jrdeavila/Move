import 'package:move_app/lib.dart';

class DashboardAdmin extends GetView<SessionCtrl> {
  const DashboardAdmin({super.key});

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
                    title: 'Solicitudes de\nregistro',
                    color: const Color.fromRGBO(255, 198, 65, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/two-people.png',
                    description: '',
                    onPressed: () {
                      //Get.to(() => const DashboardDriver());
                    },
                    width: 120,
                    height: 120,
                    top: Dimensions.screenHeight * 0.06,
                    left: Dimensions.screenWidth * 0.62,
                  ),
                  CardClassic(
                    title: 'Porcentaje\ndescuento',
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/percent.png',
                    onPressed: () {
                      //Get.toNamed(ProfileRoutes.profile);
                    },
                    size: Dimensions.screenWidth * 0.06,
                    width: 100,
                    height: 100,
                  ),
                  CardClassic(
                    title: 'Clientes',
                    color: Colors.black,
                    colorTitle: Colors.white,
                    root: 'assets/images/people-client.png',
                    onPressed: () {
                      //Get.toNamed(ProfileRoutes.profile);
                    },
                    size: Dimensions.screenWidth * 0.081,
                    width: 120,
                    height: 100,
                  ),
                  CardClassic(
                    title: 'Valor por\nKILOMETRO',
                    color: const Color.fromRGBO(255, 198, 65, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/speedometer.png',
                    onPressed: () {
                      //Get.toNamed(ProfileRoutes.profile);
                    },
                    size: Dimensions.screenWidth * 0.054,
                    width: 105,
                    height: 100,
                  ),
                  CardClassic(
                    title: 'configuración\nPLATAFORMA',
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/gear-fill.png',
                    onPressed: () {
                      //Get.toNamed(ProfileRoutes.profile);
                    },
                    size: Dimensions.screenWidth * 0.053,
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
