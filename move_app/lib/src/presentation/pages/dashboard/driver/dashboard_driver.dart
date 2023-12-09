import 'package:move_app/lib.dart';

class DashboardDriver extends GetView<SessionCtrl> {
  const DashboardDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [_buildAppBar(), _buildDashboardItems()],
        ));
  }

  SliverPadding _buildDashboardItems() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text('panel de control',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.04,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              )),
          CardDescription(
            title: 'Servicios',
            color: const Color.fromRGBO(255, 198, 65, 1),
            colorTitle: Colors.white,
            root: 'assets/images/person.png',
            description: 'Descubre las solicitudes de viaje de los pasajeros',
            onPressed: () {
              controller.goToShowServices();
              // Get.to(() => const ListService());
            },
            width: 70,
            height: 100,
            top: Dimensions.screenHeight * 0.035,
            left: Dimensions.screenWidth * 0.6,
          ),
          CardCompound(
            title: 'Modo',
            secondTitle: 'Cliente',
            color: const Color.fromRGBO(217, 217, 217, 1),
            colorTitle: Colors.white,
            root: 'assets/images/people-client.png',
            onPressed: () {
              controller.onChangeSessionToClient();
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
            size: 40,
            width: 100,
            height: 100,
          ),
        ]),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      actions: [
        TextButton(
          onPressed: controller.logout,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Salir de la app",
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Icon(
                Icons.logout_outlined,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bienvenido',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        )),
                    Obx(() =>
                        Text(controller.user?.firstname ?? "**************",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 30,
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
        ),
      ),
    );
  }

  Column _buildBalanceSection() {
    final driverBalanceCtrl = Get.find<DriverBalanceCtrl>();
    return Column(
      children: [
        Text('Saldo actual',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
            )),
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
