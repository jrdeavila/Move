import 'package:flutter/foundation.dart';
import 'package:move_app/lib.dart';

class SoundCtrl extends GetxController {
  // ---------------------- Public Methods ----------------------

  Future<void> playSound() async {
    if (kDebugMode) {
      print("on play sound");
    }
    final service = getIt<IPlaySound>();
    await service.call(PlaySoundRequest(source: 'sounds/new-service.mp3'));
  }

  Future<void> cancelSound() async {
    if (kDebugMode) {
      print("on cancel sound");
    }
    getIt<IPlaySound>().cancelSound();
  }
}
