import 'package:move_app/lib.dart';
import 'package:move_app/src/presentation/pages/dashboard/driver/dashboard_driver.dart';

class ListService extends StatefulWidget {
  const ListService({Key? key}) : super(key: key);

  @override
  State<ListService> createState() => _ListServiceState();
}

class _ListServiceState extends State<ListService> {
  final List<Map<String, dynamic>> cardDataList = [
    {
      'photo': '',
      'price': '8000',
      'paymentType': 'efectivo',
      'onPressed': () {
        print('click');
      },
      'user': 'Pedro Miguel',
      'colorText': Colors.white,
      'initialAdress': 'cll 7A.24 -31 la nueva esperanza',
      'endAdress': 'cll 6D.21-35 la esperanza',
      'onTapCancel': () {
        print('cancel');
      },
    },
    {
      'photo': '',
      'price': '8000',
      'paymentType': 'efectivo',
      'onPressed': () {
        print('click');
      },
      'user': 'Pedro Miguel',
      'colorText': Colors.white,
      'initialAdress': 'cll 7A.24 -31 la nueva esperanza',
      'endAdress': 'cll 6D.21-35 la esperanza',
      'onTapCancel': () {
        print('cancel');
      },
    },
  ];

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
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * 0.05),
        child: SizedBox(
          height: Dimensions.screenHeight * 0.82,
          child: listCardExample(context),
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
          onPressed: cardData['onPressed'],
          user: cardData['user'],
          colorText: cardData['colorText'],
          initialAdress: cardData['initialAdress'],
          endAdress: cardData['endAdress'],
          onTapCancel: cardData['onTapCancel'],
        );
      },
    );
  }
}
