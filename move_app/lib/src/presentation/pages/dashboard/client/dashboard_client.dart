import 'package:move_app/lib.dart';

class DashboardClient extends StatelessWidget {
  const DashboardClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned.fill(
          child: DashboardClientView(),
        ),
      ]),
    );
  }
}

class DashboardClientView extends GetView<SessionCtrl> {
  const DashboardClientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [_buildAppBar(), _buildDashboardItems()],
    );
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
            title: 'Solicitar servicio',
            color: const Color.fromRGBO(255, 198, 65, 1),
            colorTitle: Colors.white,
            root: 'assets/images/car.png',
            description: '¿Necesitas un viaje? ¡Estamos en camino!',
            onPressed: () {
              controller.goToRequestService();
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
              controller.onChangeSessionToDriver();
            },
          ),
          CardClassic(
            title: 'Perfil',
            color: Colors.black,
            colorTitle: Colors.white,
            root: 'assets/images/profile.png',
            onPressed: () {
              controller.goToProfile();
            },
            size: Dimensions.screenWidth * 0.12,
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
            onPressed: () {
              controller.logout();
            },
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
        floating: true,
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
                        Obx(() => Text(
                            controller.user?.firstname ?? "Nombre de usuario",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildPointSection(),
                ],
              ),
            )));
  }

  Column _buildPointSection() {
    final clientPointsCtrl = Get.find<ClientPointCtrl>();
    return Column(
      children: [
        Text('Puntos',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Dimensions.screenWidth * 0.04,
              fontWeight: FontWeight.w300,
            )),
        const SizedBox(height: 5),
        Row(
          children: [
            Obx(() => Text(clientPointsCtrl.points.toString(),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.07,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ))),
            const SizedBox(width: 5),
            Icon(Icons.star, color: Colors.yellow[700]),
          ],
        ),
      ],
    );
  }
}
