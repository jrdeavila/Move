import 'package:move_app/lib.dart';

class SearchAddressModal extends GetView<RequestServiceCtrl> {
  const SearchAddressModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
        top: MediaQuery.of(context).padding.top + 50.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          TravelPointInput(
            neighborhoodController: controller.beginNeighborhoodController,
            addressController: controller.beginAddressController,
            label: "Punto de partida",
            onTap: () {
              controller.onEditingBeginAddress();
            },
            onChangedAddress: (value) {
              controller.setAddressBegin(value);
            },
            onChangedNeighborhood: (value) {
              controller.searchTravelPoints(value);
            },
            onEnter: controller.checkIfAllAddressAreFilled,
          ),
          TravelPointInput(
            neighborhoodController: controller.endNeighborhoodController,
            addressController: controller.endAddressController,
            onChangedAddress: (value) {
              controller.setAddressEnd(value);
            },
            label: "Punto de llegada",
            onTap: () {
              controller.onEditingEndAddress();
            },
            onEnter: controller.checkIfAllAddressAreFilled,
            onChangedNeighborhood: (value) {
              controller.searchTravelPoints(value);
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final travelPoint = controller.addressessSearched[index];
                    return TravelPointItem(travelPoint: travelPoint);
                  },
                  itemCount: controller.addressessSearched.length,
                )),
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: [
        Text(
          "Escribe la ruta de viaje",
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const CloseModalButton(),
      ],
    );
  }
}

class TravelPointItem extends GetView<RequestServiceCtrl> {
  const TravelPointItem({
    super.key,
    required this.travelPoint,
  });

  final TravelPoint travelPoint;

  Icon iconByType(TravelPointType type) => ({
        TravelPointType.known: const Icon(
          Icons.lock_clock,
          color: Colors.grey,
        ),
        TravelPointType.searched: const Icon(
          Icons.location_on,
          color: Colors.grey,
        ),
      }[type]!);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        controller.selectTravelPoint(travelPoint);
      },
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      leading: iconByType(travelPoint.type),
      title: Text(
        travelPoint.name,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        travelPoint.address,
        style: GoogleFonts.montserrat(),
      ),
    );
  }
}

class TravelPointInput extends StatelessWidget {
  const TravelPointInput({
    super.key,
    required this.label,
    required this.onChangedNeighborhood,
    required this.onChangedAddress,
    required this.neighborhoodController,
    required this.addressController,
    this.onEnter,
    this.onTap,
  });

  final String label;
  final TextEditingController neighborhoodController;
  final TextEditingController addressController;
  final ValueChanged<String> onChangedNeighborhood;
  final ValueChanged<String> onChangedAddress;
  final VoidCallback? onTap;
  final VoidCallback? onEnter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Get.theme.colorScheme.primary,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: neighborhoodController,
                  keyboardType: TextInputType.streetAddress,
                  onChanged: onChangedNeighborhood,
                  onTap: onTap,
                  style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Lugar, Barrio o Vereda",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                    ),
                  ),
                ),
                TextFormField(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  onChanged: onChangedAddress,
                  onTap: onTap,
                  onFieldSubmitted: (_) => onEnter?.call(),
                  style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Dirección exacta (opcional)",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CloseModalButton extends StatelessWidget {
  const CloseModalButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.all(5.0),
        child: const Icon(
          Icons.close,
        ),
      ),
    );
  }
}

class SetTeeModal extends GetView<RequestServiceCtrl> {
  const SetTeeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        padding: const EdgeInsets.all(20.0),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Ofrezca su Tarifa",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const CloseModalButton(),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            CurrencyTextInputModal(
              initialValue: controller.teeValue,
              onChanged: controller.setTeeValue,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "Se recomienda ofrecer una tarifa que se ajuste a los precios habituales de la zona",
              style: GoogleFonts.montserrat(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Obx(() => PaymentButton(
                  value: controller.currentPayment,
                  payments: controller.paymentsAbailables,
                  onSelectMethod: controller.setCurrentPayment,
                )),
            const SizedBox(
              height: 20.0,
            ),
            ButtonClassic(
              text: "Hecho",
              onPressed: () {
                Get.back();
              },
              color: Get.theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyTextInputModal extends StatefulWidget {
  const CurrencyTextInputModal({
    super.key,
    this.initialValue,
    required this.onChanged,
    this.focus = false,
  });

  final double? initialValue;
  final ValueChanged<num> onChanged;
  final bool focus;

  @override
  State<CurrencyTextInputModal> createState() => _CurrencyTextInputModalState();
}

class _CurrencyTextInputModalState extends State<CurrencyTextInputModal> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    if (widget.focus) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (widget.focus) {
        _focusNode.requestFocus();
      }
    });
    final formatter = CurrencyTextInputFormatter(
      decimalDigits: 0,
      symbol: "",
      locale: 'es_CO',
      enableNegative: false,
    );
    return TextFormField(
      focusNode: _focusNode,
      style: GoogleFonts.montserrat(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
      inputFormatters: [formatter],
      keyboardType: TextInputType.number,
      onChanged: (_) => widget.onChanged(formatter.getUnformattedValue()),
      initialValue: formatter.formatDouble(widget.initialValue ?? 0.0),
      decoration: InputDecoration(
        hintText: "8000",
        hintStyle: const TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            "COP",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]!,
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final List<Payment> payments;
  final Payment value;
  final ValueChanged<Payment> onSelectMethod;
  const PaymentButton({
    super.key,
    required this.value,
    required this.payments,
    required this.onSelectMethod,
  });

  void _showModal(context) {
    showModalBottomSheet<Payment>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return PaymentTypeModal(
            value: value,
            payments: payments,
          );
        }).then((value) {
      if (value != null) onSelectMethod(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModal(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            iconByPaymentType(value.type),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value.name,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTypeModal extends StatelessWidget {
  final List<Payment> payments;
  final Payment value;
  const PaymentTypeModal({
    super.key,
    required this.payments,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    "Metodos de Pago",
                    style: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const CloseModalButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ...payments.map(
              (e) {
                var isSelected = value.name == e.name;
                return GestureDetector(
                  onTap: () {
                    Get.back(result: e);
                  },
                  child: Material(
                    child: Container(
                      color: isSelected
                          ? Get.theme.colorScheme.primary.withOpacity(0.3)
                          : null,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          iconByPaymentType(e.type),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            e.name,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected) const Icon(Icons.check)
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Icon iconByPaymentType(PaymentType type) => ({
      PaymentType.cash: const Icon(
        Icons.monetization_on_rounded,
      ),
      PaymentType.virtual: const Icon(
        Icons.phone_iphone_sharp,
      ),
    }[type]!);
