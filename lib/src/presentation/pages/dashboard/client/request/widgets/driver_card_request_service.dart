import 'package:mevo/lib.dart';

class CardRequestService extends GetView<ShowListServiceCtrl> {
  final RequestService requestService;
  final double width;
  final double height;
  const CardRequestService({
    super.key,
    required this.requestService,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRightBig(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        width: width,
        height: height,
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
            Spacer(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Row _buildActions() {
    final minFontSize = width * 0.03;
    return Row(
      children: [
        GestureDetector(
          onTap: () => controller.removeRequestService(requestService),
          child: Row(
            children: [
              Icon(
                Icons.remove_circle,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 5.0),
              Text(
                "Quitar",
                style: GoogleFonts.montserrat(
                  fontSize: minFontSize,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        if (requestService.payment.type != PaymentType.points)
          CardActionButton(
            color: Get.theme.colorScheme.primary,
            text: "Contra Oferta",
            fontSize: minFontSize,
            onPressed: () => controller.showContraOffertModal(requestService),
          ),
        const SizedBox(width: 5.0),
        CardActionButton(
          color: Colors.blueAccent,
          text: "Aceptar",
          fontSize: minFontSize,
          onPressed: () => controller.sendCounterOffert(requestService),
        ),
      ],
    );
  }

  Row _buildServiceDetails() {
    final minFontSize = width * 0.03;
    final maxFontSize = width * 0.04;
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Método de Pago',
                style: TextStyle(
                  fontSize: minFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  iconByPaymentType(
                    requestService.payment.type,
                    size: maxFontSize,
                  ),
                  Text(
                    requestService.payment.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: minFontSize,
                      fontWeight: FontWeight.bold,
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
                style: TextStyle(
                  fontSize: minFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                doubleCurrencyFormatter(requestService.tee),
                style: TextStyle(
                  fontSize: maxFontSize,
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

class CardActionButton extends StatelessWidget {
  const CardActionButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.fontSize = 14.0,
    this.disabled = false,
  });

  final Color color;
  final String text;
  final bool disabled;
  final double fontSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey[600] : color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
    return LayoutBuilder(builder: (context, constraints) {
      final minFontSize = constraints.maxWidth * 0.035;
      final maxFontSize = constraints.maxWidth * 0.05;
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
                  style: TextStyle(
                    fontSize: maxFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Text(
            travelPoint.address,
            style: TextStyle(
              fontSize: minFontSize,
            ),
          ),
        ],
      );
    });
  }
}
