import 'package:mevo/lib.dart';

class FeeButton extends GetView<RequestServiceCtrl> {
  const FeeButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyTextInputFormatter.currency(
      decimalDigits: 0,
      symbol: 'COP ',
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Icon(
              Icons.payments_rounded,
              color: Colors.redAccent,
              size: 30.0,
            ),
            const SizedBox(width: 10.0),
            Obx(() => Text(
                  controller.teeValue > 0
                      ? formatter.formatDouble(controller.teeValue)
                      : "Ofrezca su tarifa",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                )),
            const Spacer(),
            Obx(
              () => iconByPaymentType(controller.currentPayment.type),
            )
          ],
        ),
      ),
    );
  }
}

class AddressField extends StatelessWidget {
  const AddressField({
    super.key,
    required this.color,
    required this.name,
    required this.address,
    required this.onTap,
  });

  final Color color;
  final String address;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.location_on_rounded,
            color: color,
            size: 30.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    address,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
