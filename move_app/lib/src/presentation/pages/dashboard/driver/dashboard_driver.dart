import 'package:move_app/lib.dart';

class DashboardDriver extends GetView<SessionCtrl> {
  const DashboardDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              leadingWidth: 200,
              leading: TextButton(
                onPressed: () {
                  Get.find<SessionCtrl>().onChangeSessionToClient();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.swap_horiz,
                      size: 30.0,
                      color: Get.theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Text("Modo de Cliente",
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      _buildBalanceSection(),
                    ],
                  ),
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
                    title: 'Servicios',
                    color: const Color.fromRGBO(255, 198, 65, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/person.png',
                    description:
                        'Descubre las solicitudes de viaje de los pasajeros',
                    onPressed: () {
                      controller.goToShowServices();
                      // Get.to(() => const ListService());
                    },
                    width: 70,
                    height: 100,
                    top: Dimensions.screenHeight * 0.035,
                    left: Dimensions.screenWidth * 0.6,
                  ),
                  CardClassic(
                    title: 'Perfil',
                    color: const Color.fromRGBO(217, 217, 217, 1),
                    colorTitle: Colors.white,
                    root: 'assets/images/profile.png',
                    onPressed: () {
                      Get.toNamed(ProfileRoutes.profile);
                    },
                    size: Dimensions.screenWidth * 0.12,
                    width: 100,
                    height: 100,
                  ),
                  CardClassic(
                    title: 'Cuenta',
                    color: Colors.black,
                    colorTitle: Colors.white,
                    root: 'assets/images/cash-coin.png',
                    onPressed: () {
                      //Get.toNamed(ProfileRoutes.profile);
                      Get.to(() => const ViewAccount());
                    },
                    size: Dimensions.screenWidth * 0.09,
                    width: 100,
                    height: 100,
                  ),
                ]),
              ),
            )
          ],
        ));
  }

  Column _buildBalanceSection() {
    final driverBalanceCtrl = Get.find<DriverBalanceCtrl>();
    return Column(
      children: [
        Text('Saldo actual',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Dimensions.screenWidth * 0.04,
              fontWeight: FontWeight.w300,
            )),
        const SizedBox(height: 5),
        Row(
          children: [
            Obx(() => Text(
                doubleCurrencyFormatterWithoutSign(driverBalanceCtrl.balance),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.07,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ))),
            const SizedBox(width: 5),
            Icon(
              Icons.attach_money,
              color: Colors.yellow[700],
              size: Dimensions.screenWidth * 0.07,
            )
          ],
        ),
      ],
    );
  }
}
