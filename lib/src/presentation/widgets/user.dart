import 'package:mevo/lib.dart';

class UserProfile extends StatelessWidget {
  final String user;
  final String score;
  final String? picture;
  final Color colorText;
  const UserProfile(
      {super.key,
      required this.user,
      required this.score,
      this.picture,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserClassic(
            user: user,
            colorText: colorText,
          ),
          SizedBox(
            height: Dimensions.screenHeight * 0.01,
          ),
          Container(
              width: Dimensions.screenWidth * 0.12,
              height: Dimensions.screenHeight * 0.03,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(67, 67, 67, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 193, 7, 1),
                  ),
                  Text(
                    score,
                    style: GoogleFonts.montserrat(
                      fontSize: Dimensions.screenWidth * 0.028,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class UserClassic extends StatelessWidget {
  final String user;
  final String? picture;
  final Color colorText;

  const UserClassic(
      {super.key, required this.user, this.picture, required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: picture != null
              ? const SizedBox()
              : const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
        ),
        SizedBox(
          height: Dimensions.screenHeight * 0.01,
        ),
        Text(user,
            style: GoogleFonts.montserrat(
              color: colorText,
              fontSize: Dimensions.screenWidth * 0.03,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            )),
      ],
    );
  }
}
