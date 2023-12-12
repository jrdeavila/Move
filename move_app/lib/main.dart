import 'package:flutter/services.dart';
import 'package:move_app/lib.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    // Close Keyboard if already open
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return runApp(const App());
  }, (error, stack) {
    Get.put(ExceptionCtrl());
    Get.find<ExceptionCtrl>().exception(error);
    Get.find<ExceptionCtrl>().onDebugException(error, stack);
  });
}
