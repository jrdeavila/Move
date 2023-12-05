import 'package:audioplayers/audioplayers.dart';
import 'package:move_app/lib.dart';

class SoundCtrl extends GetxController {
  // ---------------------- Public Methods ----------------------

  void playSound() async {
    final service = getIt<IPlaySound>();
    service
        .call(PlaySoundRequest(source: AssetSource('sounds/new-service.mp3')));
  }
}
