import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IUploadFile)
class FirebaseUploadFileService implements IUploadFile {
  final FirebaseStorage _firebaseStorage;

  FirebaseUploadFileService({
    required FirebaseStorage firebaseStorage,
  }) : _firebaseStorage = firebaseStorage;

  @override
  Future<void> deleteFile(String path) {
    return _firebaseStorage.ref(path).delete();
  }

  @override
  Future<String> uploadFile(File file, String path) {
    return _firebaseStorage.ref(path).putFile(file).then((task) async {
      return await task.ref.getDownloadURL();
    });
  }

  @override
  Future<String> uploadFileBytes(Uint8List bytes, String path) {
    return _firebaseStorage.ref(path).putData(bytes).then((task) async {
      return await task.ref.getDownloadURL();
    });
  }
}
