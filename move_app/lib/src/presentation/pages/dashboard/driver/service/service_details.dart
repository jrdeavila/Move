import 'package:move_app/lib.dart';

class ServiceDetailsDriver extends StatefulWidget {
  final String paymentController;
  final String controllerInitialLocation;
  final String controllerFinalLocation;
  final Function(bool) onVisibilityChanged;
  final Function(bool) onVisibilityCancelService;
  const ServiceDetailsDriver(
      {super.key,
      required this.paymentController,
      required this.controllerInitialLocation,
      required this.controllerFinalLocation,
      required this.onVisibilityChanged,
      required this.onVisibilityCancelService});

  @override
  State<ServiceDetailsDriver> createState() => _ServiceDetailsDriverState();
}

class _ServiceDetailsDriverState extends State<ServiceDetailsDriver> {
  void _onFinishButtonPressed() {
    setState(() {
      widget.onVisibilityChanged(true);
    });
  }

  void _onFinishButtonPressedCancelSerivice() {
    setState(() {
      widget.onVisibilityCancelService(true);
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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.screenWidth * 0.085,
                      right: Dimensions.screenWidth * 0.03),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pedro Miguel',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.048,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        )),
                    Text('3016487654',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.045,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        )),
                    Row(
                      children: [
                        Text('8000',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.07,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            )),
                        SizedBox(
                          width: Dimensions.screenWidth * 0.02,
                        ),
                        Text('Efectivo',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.043,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          CardDetails(
            color: Colors.blue,
            adress: widget.controllerInitialLocation,
            title: 'Origen',
          ),
          CardDetails(
            color: const Color.fromRGBO(255, 198, 65, 1),
            adress: widget.controllerInitialLocation,
            title: 'Destino',
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.1,
                right: Dimensions.screenWidth * 0.1,
                top: Dimensions.screenHeight * 0.015),
            child: ButtonClassic(
              text: "Finalizar",
              onPressed: _onFinishButtonPressed,
              color: const Color.fromRGBO(255, 198, 65, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.1,
                right: Dimensions.screenWidth * 0.1,
                top: Dimensions.screenHeight * 0.01),
            child: ButtonBorderClassic(
              text: "Cancelar servicio",
              onPressed: _onFinishButtonPressedCancelSerivice,
              borderColor: const Color.fromRGBO(224, 26, 25, 1),
            ),
          ),
        ],
      ),
    ));
  }
}
