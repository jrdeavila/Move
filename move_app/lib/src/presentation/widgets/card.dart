import 'package:move_app/lib.dart';

class CardClassic extends StatelessWidget {
  final String? title;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;
  final double size;
  final double width;
  final double height;

  const CardClassic({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    required this.onPressed,
    required this.size,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.07,
            left: Dimensions.screenWidth * 0.12,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: size,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.04,
            left: Dimensions.screenWidth * 0.59,
            child: Image.asset(
              root!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double top;
  final double left;

  const CardDescription({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    this.description,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.045,
            left: Dimensions.screenWidth * 0.09,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.093,
            left: Dimensions.screenWidth * 0.09,
            child: SizedBox(
              width: Dimensions.width50,
              child: Text(description!,
                  style: GoogleFonts.montserrat(
                    color: colorTitle,
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  )),
            ),
          ),
          Positioned(
            top: top,
            left: left,
            child: Image.asset(
              root!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}

class CardCompound extends StatelessWidget {
  final String? title;
  final String? secondTitle;
  final Color? colorTitle;
  final Color? color;
  final String? root;
  final VoidCallback onPressed;

  const CardCompound({
    super.key,
    this.title,
    this.colorTitle,
    this.color,
    required this.root,
    this.secondTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height2),
        width: Dimensions.width80,
        height: Dimensions.screenHeight * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: [
          Positioned(
            top: Dimensions.screenHeight * 0.05,
            left: Dimensions.screenWidth * 0.12,
            child: Text(title!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.07,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.09,
            left: Dimensions.screenWidth * 0.12,
            child: Text(secondTitle!,
                style: GoogleFonts.montserrat(
                  color: colorTitle,
                  fontSize: Dimensions.screenWidth * 0.074,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                )),
          ),
          Positioned(
            top: Dimensions.screenHeight * 0.04,
            left: Dimensions.screenWidth * 0.59,
            child: Image.asset(
              root!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
    );
  }
}

class CardRequestService extends GetView<ShowListServiceCtrl> {
  final RequestService requestService;
  const CardRequestService({
    super.key,
    required this.requestService,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(4, 0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-4, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressInfo(
            travelPoint: requestService.origin,
          ),
          const SizedBox(height: 10.0),
          AddressInfo(
            travelPoint: requestService.destination,
            isOrigin: false,
          ),
          const SizedBox(height: 10.0),
          _buildServiceDetails(),
          const SizedBox(height: 10.0),
          _buildActions(),
        ],
      ),
    );
  }

  Row _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionButton(
          color: Get.theme.colorScheme.primary,
          text: "Contra Oferta",
          onPressed: () => controller.showContraOffertModal(requestService),
        ),
        const SizedBox(width: 10.0),
        _buildActionButton(
          color: Colors.blueAccent,
          text: "Aceptar",
          onPressed: () => controller.acceptService(requestService),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required Color color,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Row _buildServiceDetails() {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Metodo de Pago',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  iconByPaymentType(
                    requestService.payment.type,
                  ),
                  Text(
                    getPaymentNameByName(requestService.payment.name),
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Tarifa',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                doubleCurrencyFormatter(requestService.tee),
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.travelPoint,
    this.isOrigin = true,
  });

  final TravelPoint travelPoint;
  final bool isOrigin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: isOrigin ? Colors.blueAccent : Colors.redAccent,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                travelPoint.name,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(
          travelPoint.address,
          style: GoogleFonts.montserrat(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}
