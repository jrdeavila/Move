import 'package:mevo/lib.dart';

class ShowPointsDialog extends GetView<ClientPointCtrl> {
  const ShowPointsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    const Text("Por cada viaje recibes",
                        style: TextStyle(
                          fontSize: 20.0,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${controller.clientBonus} puntos",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Tasa de conversión",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow[800]),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text("1 Punto"),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.arrow_forward),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(doubleCurrencyFormatter(
                        controller.quotaPerPoint.toDouble())),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Tus Puntos",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                              size: 40.0,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${controller.points}",
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Valor en dinero",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() => Text(
                          "\$${doubleCurrencyFormatter(controller.pointsInMoney.toDouble())}",
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
