import 'package:audioplayers/audioplayers.dart';
import 'package:move_app/lib.dart';

class SoundCtrl extends GetxController {
  // ---------------------- Public Methods ----------------------

  Future<void> playSound() async {
    final service = getIt<IPlaySound>();
    return service
        .call(PlaySoundRequest(source: AssetSource('sounds/new-service.mp3')));
  }

  Future<void> playSoundManyTimes([int times = 3]) async {
    final service = getIt<IPlaySound>();
    return service.call(PlaySoundRequest(
        source: AssetSource('sounds/new-service.mp3'), times: times));
  }
}
