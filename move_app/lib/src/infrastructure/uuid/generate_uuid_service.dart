import 'package:move_app/lib.dart';
import 'package:uuid/uuid.dart';

class GenerateUuidService implements IGenerateUuid {
  @override
  String generate() {
    return const Uuid().v4();
  }
}
