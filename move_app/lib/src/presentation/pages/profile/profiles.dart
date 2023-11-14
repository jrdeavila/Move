import 'profile.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const DashboardClient());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.21),
          child: Text('Perfil',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width10,
            vertical: Dimensions.screenHeight * 0.03),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Container(
                  width: Dimensions.screenWidth * 0.2,
                  height: Dimensions.screenHeight * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(67, 67, 67, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromRGBO(255, 193, 7, 1),
                      ),
                      Text(
                        '4.5',
                        style: GoogleFonts.montserrat(
                          fontSize: Dimensions.screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.02,
              ),
              Text('Pedro Miguel',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: Dimensions.screenWidth * 0.05,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Text('pedromiguel@gmail.com',
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(67, 67, 67, 1),
                    fontSize: Dimensions.screenWidth * 0.04,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              CustomButton(
                  text: 'Datos personales',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    Get.offAll(() => const Details());
                  }),
              CustomButton(
                  text: 'Información del vehiculo',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    Get.offAll(() => const DetailsCar());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
