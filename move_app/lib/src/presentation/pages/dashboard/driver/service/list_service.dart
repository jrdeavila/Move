import 'package:move_app/lib.dart';

class ListService extends StatefulWidget {
  const ListService({Key? key}) : super(key: key);

  @override
  State<ListService> createState() => _ListServiceState();
}

class _ListServiceState extends State<ListService> {
  final TextEditingController paymentSuggestController =
      TextEditingController();

  bool isRateFormVisible = false;

  void toggleRateFormVisible() {
    setState(() {
      isRateFormVisible = !isRateFormVisible;
    });
  }

//fill list of services in firebase
  final List<Map<String, dynamic>> cardDataList = [];

  Widget rateForm() {
    return Positioned(
        top: Dimensions.screenHeight * 0.5,
        child: RateFormDriver(
          paymentSuggestController: paymentSuggestController,
          priceOffered: '8.000',
          onVisibilityChanged: (isVisible) {
            setState(() {
              isRateFormVisible = isVisible;
            });
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
          padding: EdgeInsets.only(left: Dimensions.screenWidth * 0.06),
          child: Text('Lista de servicios',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: Dimensions.screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              )),
        ),
      ),
      body: SizedBox(
        height: Dimensions.screenHeight * 1,
        child: Stack(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.82,
              child: ListView(children: [
                CardRequest(
                  photo: '',
                  price: '9000',
                  paymentType: 'efectivo',
                  onPressedAccepted: () {
                    Get.to(() => const ServiceAcceptedDriver());
                  },
                  user: 'Pedro Miguel',
                  colorText: Colors.white,
                  initialAdress: 'cll 7A.24 -31 la nueva esperanza',
                  endAdress: 'cll 6D.21-35 la esperanza',
                  onPressedOffer: toggleRateFormVisible,
                ),
                CardRequest(
                  photo: '',
                  price: '9000',
                  paymentType: 'efectivo',
                  onPressedAccepted: () {
                    Get.to(() => const ServiceAcceptedDriver());
                  },
                  user: 'Pedro Miguel',
                  colorText: Colors.white,
                  initialAdress: 'cll 7A.24 -31 la nueva esperanza',
                  endAdress: 'cll 6D.21-35 la esperanza',
                  onPressedOffer: toggleRateFormVisible,
                ),
                CardRequest(
                  photo: '',
                  price: '9000',
                  paymentType: 'efectivo',
                  onPressedAccepted: () {
                    Get.to(() => const ServiceAcceptedDriver());
                  },
                  user: 'Pedro Miguel',
                  colorText: Colors.white,
                  initialAdress: 'cll 7A.24 -31 la nueva esperanza',
                  endAdress: 'cll 6D.21-35 la esperanza',
                  onPressedOffer: toggleRateFormVisible,
                ),
                CardRequest(
                  photo: '',
                  price: '9000',
                  paymentType: 'efectivo',
                  onPressedAccepted: () {
                    Get.to(() => const ServiceAcceptedDriver());
                  },
                  user: 'Pedro Miguel',
                  colorText: Colors.white,
                  initialAdress: 'cll 7A.24 -31 la nueva esperanza',
                  endAdress: 'cll 6D.21-35 la esperanza',
                  onPressedOffer: toggleRateFormVisible,
                ),
              ]),
            ),
            isRateFormVisible ? rateForm() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget listCardExample(BuildContext context) {
    return ListView.builder(
      itemCount: cardDataList.length,
      itemBuilder: (context, index) {
        final cardData = cardDataList[index];

        return CardRequest(
          photo: cardData['photo'],
          price: cardData['price'],
          paymentType: cardData['paymentType'],
          onPressedAccepted: cardData['onPressed'],
          user: cardData['user'],
          colorText: cardData['colorText'],
          initialAdress: cardData['initialAdress'],
          endAdress: cardData['endAdress'],
          onPressedOffer: cardData['onTapCancel'],
        );
      },
    );
  }
}
