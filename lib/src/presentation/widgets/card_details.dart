import 'package:mevo/lib.dart';

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
    final fontSize = MediaQuery.of(context).size.height * 0.02;
    final minFontSize = MediaQuery.of(context).size.height * 0.015;
    final paddingY = MediaQuery.of(context).size.height * 0.005;
    final paddingX = MediaQuery.of(context).size.width * 0.05;
    final iconSize = MediaQuery.of(context).size.height * 0.04;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingY, horizontal: paddingX),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.album,
            color: color,
            size: iconSize,
          ),
          SizedBox(
            width: Dimensions.screenWidth * 0.03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  width: Dimensions.screenWidth * 0.7,
                  child: Text(
                    adress,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: minFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
