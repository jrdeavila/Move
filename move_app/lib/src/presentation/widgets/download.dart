import 'package:move_app/lib.dart';

class InputDownload extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final String root;
  final VoidCallback? onPressed;

  const InputDownload({
    super.key,
    required this.title,
    this.onPressed,
    required this.root,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.screenHeight * 0.019),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        color: Colors.white,
        elevation: 0,
        onPressed: onPressed,
        minWidth: Dimensions.screenWidth * 0.06,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.screenWidth * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                root,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: Dimensions.screenWidth * 0.3,
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.045,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
