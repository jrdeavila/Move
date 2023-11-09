import 'package:move_app/lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/principal': (context) => const Main(),
      },
      getPages: [
        ...AuthenticationRoutes.routes,
      ],
      home: const Main(),
    );
  }
}
