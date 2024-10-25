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
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight * 0.2;
      final fontSize = width * 0.06;
      final fontDescription = width * 0.04;
      final imageSize = width * 0.2;
      return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          _buildAppBar(),
          _buildDashboardItems(
            width: width,
            height: height,
            fontSize: fontSize,
            fontDescription: fontDescription,
            imageSize: imageSize,
          )
        ],
      );
    });
  }

  SliverPadding _buildDashboardItems({
    required double width,
    required double height,
    required double fontSize,
    required double fontDescription,
    required double imageSize,
  }) {
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
          DashboardCard(
            width: width,
            height: height,
            fontSize: fontSize,
            descriptionFontSize: fontDescription,
            imageSize: imageSize,
            title: 'Pedir un viaje',
            color: const Color.fromRGBO(255, 198, 65, 1),
            textColor: Colors.white,
            imageAsset: 'assets/images/car.png',
            description: '¿Necesitas un viaje? ¡Estamos en camino!',
            onPressed: () {
              controller.goToRequestService();
            },
          ),
          DashboardCard(
            width: width,
            height: height,
            fontSize: fontSize,
            descriptionFontSize: fontDescription,
            imageSize: imageSize,
            title: 'Modo conductor',
            description: '¿Quieres ser conductor? ¡Activa el modo conductor!',
            color: const Color.fromRGBO(217, 217, 217, 1),
            textColor: Colors.black,
            imageAsset: 'assets/images/steering.png',
            onPressed: () {
              controller.onChangeSessionToDriver();
            },
          ),
          DashboardCard(
            width: width,
            height: height,
            fontSize: fontSize,
            descriptionFontSize: fontDescription,
            imageSize: imageSize,
            title: 'Perfil',
            description: 'Actualiza tu información',
            textColor: Colors.white,
            color: Colors.black,
            imageAsset: 'assets/images/profile.png',
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
