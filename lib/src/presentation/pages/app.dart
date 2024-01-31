import 'package:mevo/lib.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(255, 198, 65, 1);
    const swatch = <int, Color>{
      50: color,
      100: color,
      200: color,
      300: color,
      400: color,
      500: color,
      600: color,
      700: color,
      800: color,
      900: color,
    };
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
        colorScheme: ColorScheme.fromSwatch(
          accentColor: color,
          backgroundColor: Colors.grey[200]!,
          primarySwatch: MaterialColor(
            color.value,
            swatch,
          ),
          brightness: Brightness.light,
        ),
      ),
      getPages: [
        ...MainRoutes.routes,
        ...AuthenticationRoutes.routes,
        ...DashboardRoutes.routes,
      ],
      initialRoute: MainRoutes.loading,
      initialBinding: MainBinding(),
    );
  }
}
