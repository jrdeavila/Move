import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:url_launcher/url_launcher.dart';

@LazySingleton(as: IChatService)
class WhatsappChatMessageService implements IChatService {
  @override
  Future<void> sendMessage(
      {required String message, required String numberPhone}) {
    final uri = Uri.parse("https://wa.me/$numberPhone?text=$message");
    return launchUrl(uri);
  }
}
