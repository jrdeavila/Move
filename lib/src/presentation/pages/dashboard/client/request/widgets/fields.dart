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
    final fontSize = MediaQuery.of(context).size.width * 0.04;
    final padding = MediaQuery.of(context).size.width * 0.025;
    final iconSize = MediaQuery.of(context).size.width * 0.08;
    final minIconSize = MediaQuery.of(context).size.width * 0.06;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(padding),
        child: Row(
          children: [
            Icon(
              Icons.payments_rounded,
              color: Colors.redAccent,
              size: iconSize,
            ),
            const SizedBox(width: 10.0),
            Obx(() => Text(
                  controller.teeValue > 0
                      ? formatter.formatDouble(controller.teeValue)
                      : "Ofrezca su tarifa",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                  ),
                )),
            const Spacer(),
            Obx(
              () => iconByPaymentType(controller.currentPayment.type,
                  size: minIconSize),
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
    final fontSize = MediaQuery.of(context).size.width * 0.04;
    final minFontSize = MediaQuery.of(context).size.width * 0.03;
    final padding = MediaQuery.of(context).size.width * 0.025;
    final iconSize = MediaQuery.of(context).size.width * 0.08;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.location_on_rounded,
            color: color,
            size: iconSize,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: minFontSize,
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
