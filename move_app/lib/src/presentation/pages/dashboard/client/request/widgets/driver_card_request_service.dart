import 'package:move_app/lib.dart';

class CardRequestService extends StatefulWidget {
  final DriverLyfeCicleOfRequestService requestServiceWithTimer;
  const CardRequestService({
    super.key,
    required this.requestServiceWithTimer,
  });

  @override
  State<CardRequestService> createState() => _CardRequestServiceState();
}

class _CardRequestServiceState extends State<CardRequestService> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set State to update the timer every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.requestServiceWithTimer.timer.isActive == false) {
        _timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInRightBig(
      child: FadeOutLeftBig(
        animate: _timer.tick > lyfeTimeOfRequestService - 2,
        child: Container(
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
                travelPoint:
                    widget.requestServiceWithTimer.requestService.origin,
              ),
              const SizedBox(height: 10.0),
              AddressInfo(
                travelPoint:
                    widget.requestServiceWithTimer.requestService.destination,
                isOrigin: false,
              ),
              const SizedBox(height: 10.0),
              _buildServiceDetails(),
              const SizedBox(height: 10.0),
              _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildActions() {
    final controller = Get.find<ShowListServiceCtrl>();
    return Row(
      children: [
        Icon(
          Icons.access_time_filled,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 5.0),
        Text(
          "${lyfeTimeOfRequestService - _timer.tick - 2} Seg",
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        CardActionButton(
            color: Get.theme.colorScheme.primary,
            text: "Contra Oferta",
            onPressed: () => controller.showContraOffertModal(
                widget.requestServiceWithTimer.requestService)),
        const SizedBox(width: 5.0),
        CardActionButton(
            color: Colors.blueAccent,
            text: "Aceptar",
            onPressed: () => controller.sendCounterOffert(
                widget.requestServiceWithTimer.requestService)),
      ],
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
                    widget.requestServiceWithTimer.requestService.payment.type,
                  ),
                  Text(
                    getPaymentNameByName(widget
                        .requestServiceWithTimer.requestService.payment.name),
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
                doubleCurrencyFormatter(
                    widget.requestServiceWithTimer.requestService.tee),
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

class CardActionButton extends StatelessWidget {
  const CardActionButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.disabled = false,
  });

  final Color color;
  final String text;
  final bool disabled;
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
            fontSize: 14.0,
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
