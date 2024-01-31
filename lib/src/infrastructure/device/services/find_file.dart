import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';
import 'package:file_picker/file_picker.dart';

@Injectable(as: IFileSearchService)
class FindFileService implements IFileSearchService {
  @override
  Future<File> findFile({required List<String> allowedExtensions}) {
    return FilePicker.platform
        .pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
        )
        .then((value) => value!.files.first.path!)
        .then((value) => File(value));
  }
}
