import 'dart:io';
import 'dart:typed_data';

abstract class IUploadFile {
  Future<String> uploadFile(File file, String path);
  Future<String> uploadFileBytes(Uint8List bytes, String path);
  Future<void> deleteFile(String path);
}
