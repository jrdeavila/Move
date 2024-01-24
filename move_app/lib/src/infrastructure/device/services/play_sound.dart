import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';
import 'package:audioplayers/audioplayers.dart';

@Injectable(as: IPlaySound)
class AudioPlayerPlaySound implements IPlaySound {
  final AudioPlayer _player = AudioPlayer();
  @override
  Future<void> call(PlaySoundRequest request) async {
    await _player.play(
      AssetSource(request.source),
      volume: 1.0,
      mode: PlayerMode.lowLatency,
    );
  }

  @override
  Future<void> cancelSound() async {
    await _player.stop();
  }
}
