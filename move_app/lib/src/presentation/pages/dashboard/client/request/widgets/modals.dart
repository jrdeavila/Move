import 'package:move_app/lib.dart';

class SearchAddressModal extends StatelessWidget {
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
          const SizedBox(
            height: 20.0,
          ),
          TextInput(
            hintText: "Desde",
            prefixIcon: Icon(
              Icons.search,
            ),
            suffixIcon: Icon(Icons.cancel),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextInput(
            hintText: "A",
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.redAccent,
            ),
            suffixIcon: Icon(Icons.cancel),
          ),
          TextButton(
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.my_location,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("Seleccionar en el mapa"),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0,
                  leading: const Icon(
                    Icons.location_on_outlined,
                    size: 30.0,
                  ),
                  title: Text(
                    "Campo de Futbol de Villa Miriam",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Calle 18A # 30 - 21, Valledupar - Cesar",
                    style: GoogleFonts.montserrat(),
                  ),
                );
              },
            ),
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

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(
        fontSize: 18.0,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
            TextFormField(
              style: GoogleFonts.montserrat(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              decoration: const InputDecoration(
                prefix: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "COP",
                  ),
                ),
              ),
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
              onPressed: () {},
              color: Get.theme.colorScheme.primary,
            ),
          ],
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
                            e.name.capitalize!,
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
