import 'package:audioplayers/audioplayers.dart';

abstract class IPlaySound {
  Future<void> call(PlaySoundRequest request);
}

class PlaySoundRequest {
  final Source source;
  final int times;

  PlaySoundRequest({
    required this.source,
    this.times = 1,
  });
}
