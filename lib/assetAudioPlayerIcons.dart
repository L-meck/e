import 'package:ethic/playingControls.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

//PLAYER CONTROLS
class PlayerControlsCenter extends StatefulWidget {
  final Playing playing;
  final List<Audio> audios;
  final Function(Audio) onSelected;
  final Function(List<Audio>) onPlaylistSelected;

   const PlayerControlsCenter(
      {Key? key, required this.playing,
      required this.audios,
      required this.onSelected,
      required this.onPlaylistSelected}) : super(key: key);

  @override
  _PlayerControlsCenterState createState() => _PlayerControlsCenterState();
}

class _PlayerControlsCenterState extends State<PlayerControlsCenter> {
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");

  @override
  Widget build(BuildContext context) {
    return //PLAY BUTTONS
        _assetsAudioPlayer.builderLoopMode(
      builder: (context, loopMode) {
        return PlayerBuilder.isPlaying(
          player: _assetsAudioPlayer,
          builder: (context, isPlaying) {
            return PlayingControls(
              loopMode: loopMode,
              isPlaying: isPlaying,
              isPlaylist: true,
              onStop: () {
                _assetsAudioPlayer.stop();
              },
              toggleLoop: () {
                _assetsAudioPlayer.toggleLoop();
              },
              onPlay: () {
                _assetsAudioPlayer.playOrPause();
              },
              onNext: () {
                //_assetsAudioPlayer.forward(Duration(seconds: 10));
                _assetsAudioPlayer.next(
                    // keepLoopMode: false,
                    );
              },
              onPrevious: () {
                _assetsAudioPlayer.previous(
                    // keepLoopMode: false,
                    );
              },
            );
          },
        );
      },
    );
  }
}

//asset player icons

class AssetAudioPlayerIcons {
  AssetAudioPlayerIcons._();

  static const _kFontFam = 'AssetAudioPlayer';

  static const IconData play = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData stop = IconData(0xe801, fontFamily: _kFontFam);
  static const IconData pause = IconData(0xe802, fontFamily: _kFontFam);
  static const IconData to_end = IconData(0xe803, fontFamily: _kFontFam);
  static const IconData to_start = IconData(0xe804, fontFamily: _kFontFam);
}
