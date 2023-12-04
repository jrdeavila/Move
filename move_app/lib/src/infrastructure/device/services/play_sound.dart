import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IPlaySound)
class AudioPlayerPlaySound implements IPlaySound {
  final AudioPlayer _audioPlayer;

  AudioPlayerPlaySound(this._audioPlayer);

  @override
  Future<void> call(PlaySoundRequest request) {
    return _audioPlayer.play(request.source);
  }
}
