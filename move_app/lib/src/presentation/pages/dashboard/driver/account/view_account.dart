import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/pages/dashboard/driver/account/recharge_account.dart';
import 'package:move_app/src/presentation/pages/dashboard/driver/dashboard_driver.dart';
import 'package:move_app/src/presentation/widgets/card_account.dart';

class ViewAccount extends StatelessWidget {
  const ViewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const DashboardDriver());
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.025),
          child: Text('Consultar cuenta',
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
              const CardAccount(
                themeBackground: 'amber',
                theme: 'amber',
                price: '8,000',
                title: 'DISPONIBLE',
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.03,
              ),
              CustomButton(
                  text: 'Recargar cuenta',
                  icon: Icons.arrow_forward_ios_rounded,
                  onPressed: () {
                    //Get.toNamed(ProfileRoutes.details);
                    Get.to(() => const RechargeAccount());
                  }),
              CustomButton(
                text: 'Preferencia de pago',
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
