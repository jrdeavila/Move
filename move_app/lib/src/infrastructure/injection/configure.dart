import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'configure.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() {
  return getIt.init();
}
