import 'package:mevo/lib.dart';

class DriverRequestLoading extends StatelessWidget {
  const DriverRequestLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<DriverRequestRegisterCtrl>();
        return Future.value(true);
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
