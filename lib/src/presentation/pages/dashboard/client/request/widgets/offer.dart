import 'package:mevo/lib.dart';

class OfferCardItem extends StatelessWidget {
  const OfferCardItem({
    super.key,
    required this.offer,
  });

  final RequestService offer;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ListenCurrentServiceCtrl>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Material(
          child: ListTile(
            minVerticalPadding: 20.0,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        offer.driver!.firstname,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: Get.theme.colorScheme.primary),
                          const SizedBox(width: 8.0),
                          Text(
                            "4.5",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(Icons.car_rental),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${offer.driver!.driverInfo!.carBrand} ${offer.driver!.driverInfo!.carModel}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.0,
                                    )),
                                Text(
                                  "Placa: ${offer.driver!.driverInfo!.carPlate}",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      doubleCurrencyFormatter(offer.tee),
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    CardActionButton(
                      color: Colors.blueAccent,
                      text: "Aceptar",
                      onPressed: () {
                        controller.acceptDriverOffert(offer);
                      },
                    ),
                  ],
                )
              ],
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
