import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() {
  return Future.wait([
    getIt.init(),
    GetStorage.init(),
  ]);
}
