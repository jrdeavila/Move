import 'package:mevo/lib.dart';

class ListServicePage extends GetView<ShowListServiceCtrl> {
  const ListServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const DashboardDriver());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.06),
          child: Text('Lista de servicios',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: SizedBox(
        height: Dimensions.screenHeight * 1,
        child: Stack(
          children: [
            SizedBox(
                height: Dimensions.screenHeight * 0.82,
                child: _buildListServices()),
          ],
        ),
      ),
    );
  }

  Widget _buildListServices() {
    return Obx(() {
      if (controller.listRequestService.isEmpty) {
        return const Center(
          child: NoServiceYetMessage(),
        );
      } else {
        return ListView.builder(
          itemCount: controller.listRequestService.length,
          itemBuilder: (context, index) {
            final requestServiceWithTimer =
                controller.listRequestService[index];

            return CardRequestService(
              requestService: requestServiceWithTimer,
            );
          },
        );
      }
    });
  }
}

class NoServiceYetMessage extends StatelessWidget {
  const NoServiceYetMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[300],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: Colors.black,
            size: 100,
          ),
          const SizedBox(height: 10.0),
          Text(
            'No hay servicios disponibles'.toUpperCase(),
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Dimensions.screenWidth * 0.05,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
