import 'pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/principal': (context) => const Main(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
      home: const Main(),
    );
  }
}
