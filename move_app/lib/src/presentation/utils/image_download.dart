import 'dart:typed_data';
import 'package:http/http.dart' as http;

// Download image from network
Future<Uint8List> imageFromNetworkImage(String? imageUrl) async {
  if (imageUrl == null) {
    throw Exception('Failed to load image');
  }
  var response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Failed to load image');
  }
}
