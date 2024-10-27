import 'package:mevo/lib.dart';

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
      final fontSize = height * 0.15;
      final fontDescription = height * 0.08;
      final imageSize = width * 0.2;
      return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          _buildAppBar(context),
          _buildDashboardItems(
            context,
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

  SliverPadding _buildDashboardItems(
    BuildContext context, {
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
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              )),
          DashboardCard(
            width: width,
            height: height,
            fontSize: fontSize,
            descriptionFontSize: fontDescription,
            imageSize: imageSize,
            title: 'Pedir un viaje',
            color: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            icon: Icons.location_on,
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
            color: Theme.of(context).colorScheme.tertiary,
            textColor: Colors.black,
            icon: Icons.directions_car,
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
            icon: Icons.person,
            onPressed: () {
              controller.goToProfile();
            },
          ),
        ]),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.14;
    final nameFontSize = height * 0.18;
    final minFontSize = height * 0.12;
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
                    fontSize: minFontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.logout_outlined,
                  size: nameFontSize,
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
            preferredSize: Size.fromHeight(height),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bienvenido',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: minFontSize,
                              fontWeight: FontWeight.w300,
                            )),
                        Obx(() => Text(
                            controller.user?.firstname ?? "Nombre de usuario",
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: nameFontSize,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildPointSection(context),
                ],
              ),
            )));
  }

  Widget _buildPointSection(BuildContext context) {
    final clientPointsCtrl = Get.find<ClientPointCtrl>();
    final minFontSize = MediaQuery.of(context).size.height * 0.02;
    final maxFontSize = MediaQuery.of(context).size.height * 0.025;
    return GestureDetector(
      onTap: () {
        clientPointsCtrl.goToPoints();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Puntos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: minFontSize,
                      fontWeight: FontWeight.w300,
                    )),
                const SizedBox(width: 5),
                Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: maxFontSize,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Obx(() => Text(clientPointsCtrl.points.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: maxFontSize,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ))),
                const SizedBox(width: 5),
                Icon(Icons.star, color: Colors.yellow[700]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
