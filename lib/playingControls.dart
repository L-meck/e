import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

//PLAYER CONTROLS

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function()? onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  PlayingControls({
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");

  Widget _loopIcon(BuildContext context) {
    // final iconSize = 34.0;
    if (loopMode == LoopMode.none) {
      return Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.loop,
            // size: iconSize,
            color: Colors.black38,
          ),
          Center(
            child: Text(
              "0",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    } else if (loopMode == LoopMode.playlist) {
      return Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.loop,
            // size: iconSize,
            color: Colors.black,
          ),
          Center(
            child: Text(
              "all",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    } else {
      //single
      return Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.loop,
            // size: iconSize,
            color: Colors.black,
          ),
          Center(
            child: Text(
              "1",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //PLAY CONTROLS SECTION
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        //LOOP BUTTON
        GestureDetector(
          onTap: () {
            toggleLoop!();
          },
          child: _loopIcon(context),
        ),

        //PREVIOUS BUTTON
        IconButton(
          icon: const Icon(Icons.skip_previous),
          onPressed: isPlaylist ? onPrevious : null,
        ),

        IconButton(
          icon: const Icon(Icons.fast_rewind_outlined),
          onPressed: () =>
              _assetsAudioPlayer.seekBy(const Duration(seconds: -10)),
        ),
        //PLAY BUTTON
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 15,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(isPlaying
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled),
            iconSize: 60,
            onPressed: onPlay,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        //NEXT SONG BUTTON

        IconButton(
          icon: const Icon(Icons.fast_forward_outlined),
          onPressed: () =>
              _assetsAudioPlayer.seekBy(const Duration(seconds: 10)),
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          onPressed: isPlaylist ? this.onNext : this.onNext,
        ),

        //STOP BUTTON
        if (onStop != null)
          IconButton(
            icon: const Icon(Icons.stop),
            iconSize: 32,
            onPressed: onStop,
          ),
      ],
    );
  }
}
