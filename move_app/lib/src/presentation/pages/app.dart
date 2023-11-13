import 'package:move_app/lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        ...MainRoutes.routes,
        ...AuthenticationRoutes.routes,
      ],
      initialRoute: MainRoutes.main,
    );
  }
}
