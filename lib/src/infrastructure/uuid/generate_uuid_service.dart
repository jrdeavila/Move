import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: IGenerateUuid)
class GenerateUuidService implements IGenerateUuid {
  @override
  String generate() {
    return const Uuid().v4();
  }
}
