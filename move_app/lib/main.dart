import 'package:move_app/lib.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    return runApp(const App());
  }, (error, stack) {
    Get.find<ExceptionCtrl>().exception(error);
  });
}
