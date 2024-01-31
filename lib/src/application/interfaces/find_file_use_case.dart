import 'dart:io';

import 'package:mevo/lib.dart';

abstract class IFindFileUseCase {
  Future<File> call(FindFileRequest request);
}

abstract class IFileSearchService {
  Future<File> findFile({required List<String> allowedExtensions});
}
