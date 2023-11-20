import 'package:move_app/lib.dart';

class ServiceCanceledDriver extends StatefulWidget {
  final Function(bool) onVisibilityChangedServiceCanceled;

  const ServiceCanceledDriver({
    super.key,
    required this.onVisibilityChangedServiceCanceled,
  });

  @override
  State<ServiceCanceledDriver> createState() => _ServiceCanceledDriverState();
}

class _ServiceCanceledDriverState extends State<ServiceCanceledDriver> {
  int _selectedOption = 0;

  List<String> options = [
    'Cambio de planes',
    'Demora excesiva',
    'Problema con el pasajero',
    'Problema con el vehículo',
  ];
  void backButtonPressed() {
    setState(() {
      widget.onVisibilityChangedServiceCanceled(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Dimensions.screenHeight * 0.46,
        child: FadeInUpBig(
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
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.screenWidth * 0.02,
                right: Dimensions.screenWidth * 0.02,
                top: Dimensions.screenHeight * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: backButtonPressed,
                        icon: const Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.screenWidth * 0.03),
                        child: Text('Cancelacion de servicio',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.055,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.screenWidth * 0.05,
                        vertical: Dimensions.screenHeight * 0.01),
                    child: Text(
                        '¿Por qué desea cancelar tu servicio de transporte?',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        )),
                  ),
                  Column(
                    children: options
                        .asMap()
                        .entries
                        .map(
                          (entry) => RadioListTile(
                            title: Text(
                              entry.value,
                              style: GoogleFonts.montserrat(
                                fontSize: Dimensions.screenWidth * 0.04,
                              ),
                            ),
                            value: entry.key,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  ButtonClassic(
                    text: "Confirmar cancelación",
                    onPressed: () {
                      setState(() {});
                    },
                    color: const Color.fromRGBO(224, 26, 25, 1),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
