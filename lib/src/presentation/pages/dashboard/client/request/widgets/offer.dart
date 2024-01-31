import 'package:mevo/lib.dart';

class OfferCardItem extends StatefulWidget {
  const OfferCardItem({
    super.key,
    required this.offer,
  });

  final TimeLyfeOfOffer? offer;

  @override
  State<OfferCardItem> createState() => _OfferCardItemState();
}

class _OfferCardItemState extends State<OfferCardItem> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    // Set State to update the timer every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.offer?.timer.isActive == false) {
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
    final controller = Get.find<ListenCurrentServiceCtrl>();
    return FadeInRightBig(
      child: FadeOutLeftBig(
        animate: _timer.tick > lyfeTimeOfOffer - 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Material(
              child: ListTile(
                minVerticalPadding: 20.0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_filled,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              "${lyfeTimeOfOffer - 2 - _timer.tick} Seg",
                              style: GoogleFonts.montserrat(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
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
                            widget.offer!.offer.driver!.firstname,
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
                                        "${widget.offer!.offer.driver!.driverInfo!.carBrand} ${widget.offer!.offer.driver!.driverInfo!.carModel}",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.0,
                                        )),
                                    Text(
                                      "Placa: ${widget.offer!.offer.driver!.driverInfo!.carPlate}",
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
                          doubleCurrencyFormatter(
                              widget.offer?.offer.tee ?? 0.0),
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
                            controller.acceptDriverOffert(widget.offer!.offer);
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
        ),
      ),
    );
  }
}
