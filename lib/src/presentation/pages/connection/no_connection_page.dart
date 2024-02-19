import 'package:mevo/lib.dart';

class NoConnectionPage extends GetView<ConnectionCtrl> {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi, size: 100),
            const SizedBox(height: 20),
            Text(
              'No hay conexión a internet',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 50),
            ButtonClassic(
              text: "Volver a intentar",
              onPressed: controller.retry,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
