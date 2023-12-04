import 'package:move_app/lib.dart';

class FeeButton extends StatelessWidget {
  const FeeButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
            Text(
              "Ofrezca su tarifa",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.phone_iphone_sharp,
              color: Colors.blue,
              size: 30.0,
            ),
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
    required this.address,
    required this.onTap,
  });

  final Color color;
  final String address;
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
              child: Text(
                address,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
