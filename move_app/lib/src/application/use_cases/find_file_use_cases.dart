import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IFindFileUseCase)
class FindFileUseCase extends IFindFileUseCase {
  final IFileSearchService _fileSearchService;

  FindFileUseCase(this._fileSearchService);

  @override
  Future<File> call(FindFileRequest request) {
    return _fileSearchService.findFile(
      allowedExtensions: request.allowedExtensions,
    );
  }
}
