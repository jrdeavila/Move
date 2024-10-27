import 'package:mevo/lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    WakelockPlus.enable();
    var theme = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        toolbarHeight: kToolbarHeight + 50.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ),
      colorScheme: ColorScheme(
        primary: const Color.fromRGBO(255, 198, 65, 1),
        onPrimary: Colors.white,
        secondary: Colors.grey[400]!,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        brightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      getPages: [
        ...MainRoutes.routes,
        ...AuthenticationRoutes.routes,
        ...DashboardRoutes.routes,
        ...ConnectionRoutes.routes,
      ],
      initialRoute: MainRoutes.loading,
      initialBinding: MainBinding(),
    );
  }
}
