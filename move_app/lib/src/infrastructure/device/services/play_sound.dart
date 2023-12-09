import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IPlaySound)
class AudioPlayerPlaySound implements IPlaySound {
  @override
  Future<void> call(PlaySoundRequest request) async {
    for (int i = 0; i < request.times; i++) {
      final audioPlayer = AudioPlayer(
        playerId: "player_$i",
      );
      await audioPlayer.play(
        request.source,
        mode: PlayerMode.lowLatency,
      );
      await Future.delayed(const Duration(seconds: 5));
      await audioPlayer.dispose();
    }
  }
}
