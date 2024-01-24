abstract class IPlaySound {
  Future<void> call(PlaySoundRequest request);
  Future<void> cancelSound();
}

class PlaySoundRequest {
  final String source;

  PlaySoundRequest({
    required this.source,
  });
}
