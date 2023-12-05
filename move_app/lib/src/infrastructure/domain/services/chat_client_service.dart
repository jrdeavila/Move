import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IChatWithClientService)
class ChatWithClientService implements IChatWithClientService {
  final IChatService _chatService;

  ChatWithClientService(this._chatService);

  @override
  Future<void> chat(AppUser client) {
    return _chatService.sendMessage(
      message: "Hola, soy ${client.firstname} soy tu conductor",
      numberPhone: client.phone,
    );
  }
}
