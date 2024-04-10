import 'package:mevo/lib.dart';

class DashboardDriver extends GetView<SessionCtrl> {
  const DashboardDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [_buildAppBar(), _buildDashboardItems()],
        ));
  }

  SliverPadding _buildDashboardItems() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text('Dashboard',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              )),
          Obx(() {
            final hasBalance = Get.find<DriverBalanceCtrl>().balance > 0;
            if (hasBalance) {
              return CardDescription(
                title: 'Servicios',
                color: const Color.fromRGBO(255, 198, 65, 1),
                textColor: Colors.white,
                icon: Icons.location_on,
                description:
                    'Descubre las solicitudes de viaje de los pasajeros',
                onPressed: () {
                  controller.goToShowServices();
                  // Get.to(() => const ListService());
                },
              );
            }
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Servicios bloqueados",
                      style: GoogleFonts.montserrat(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      )),
                  Text(
                      "Para poder ver los servicios debes tener saldo a favor en tu cuenta",
                      style: GoogleFonts.montserrat(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            );
          }),
          CardDescription(
            title: 'Modo Cliente',
            description: '¿Quieres pedir un viaje? ¡Activa el modo cliente!',
            color: const Color.fromRGBO(217, 217, 217, 1),
            textColor: Colors.black,
            icon: Icons.person,
            onPressed: () {
              controller.onChangeSessionToClient();
            },
          ),
          CardDescription(
            title: 'Perfil',
            description: 'Actualiza tu información',
            textColor: Colors.white,
            color: Colors.black,
            icon: Icons.person,
            onPressed: () {
              controller.goToProfile();
            },
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
                  fontWeight: FontWeight.w600,
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
        preferredSize: const Size.fromHeight(145),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text("Modo Conductor",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Row(
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
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const BalanceSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceSection extends GetView<DriverBalanceCtrl> {
  const BalanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final textColor = controller.balance < 0 ? Colors.red : Colors.black;
      final bgColor =
          controller.balance < 0 ? Colors.red[100] : Colors.transparent;
      final iconColor =
          controller.balance < 0 ? Colors.red : Colors.yellow[700];
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text('Saldo actual',
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                )),
            Row(
              children: [
                Text(doubleCurrencyFormatterWithoutSign(controller.balance),
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontSize: Dimensions.screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    )),
                const SizedBox(width: 5),
                Icon(
                  Icons.attach_money,
                  color: iconColor,
                  size: Dimensions.screenWidth * 0.07,
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
