import 'package:move_app/lib.dart';

class ServiceDetails extends StatefulWidget {
  final TextEditingController paymentController;
  final TextEditingController controllerInitialLocation;
  final TextEditingController controllerFinalLocation;
  final Function(bool) onVisibilityChanged;

  const ServiceDetails(
      {super.key,
      required this.paymentController,
      required this.controllerInitialLocation,
      required this.controllerFinalLocation,
      required this.onVisibilityChanged});

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  void _onFinishButtonPressed() {
    setState(() {
      widget.onVisibilityChanged(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
        child: Container(
      width: Dimensions.screenWidth * 1,
      height: Dimensions.screenHeight * 0.55,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.screenHeight * 0.035,
              bottom: Dimensions.screenHeight * 0.02,
            ),
            child: Text('Solicitando servicio',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: Dimensions.screenWidth * 0.06,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                )),
          ),
          Text('COP ${widget.paymentController.text}',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.06,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              )),
          CardDetails(
            color: Colors.blue,
            adress: widget.controllerInitialLocation.text,
            title: 'Origen',
          ),
          CardDetails(
            color: const Color.fromRGBO(255, 198, 65, 1),
            adress: widget.controllerInitialLocation.text,
            title: 'Destino',
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.1,
                right: Dimensions.screenWidth * 0.1,
                top: Dimensions.screenHeight * 0.01),
            child: ButtonClassic(
              text: "Cancelar",
              onPressed: _onFinishButtonPressed,
              color: const Color.fromRGBO(224, 26, 25, 1),
            ),
          ),
        ],
      ),
    ));
  }
}
