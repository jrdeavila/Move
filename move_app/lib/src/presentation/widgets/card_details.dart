import 'package:move_app/lib.dart';

class CardDetails extends StatelessWidget {
  final String adress;
  final String title;
  final Color color;
  const CardDetails(
      {super.key,
      required this.color,
      required this.adress,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.01),
      child: SizedBox(
        width: Dimensions.screenWidth * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.album,
              color: color,
            ),
            SizedBox(
              width: Dimensions.screenWidth * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.01,
                ),
                SizedBox(
                  width: Dimensions.screenWidth * 0.7,
                  child: Text(
                    adress,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: Dimensions.screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
