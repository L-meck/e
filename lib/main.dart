import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ethic/assetAudioPlayerIcons.dart';
import 'package:ethic/empty.dart';
import 'package:ethic/positionSeek.dart';
import 'package:ethic/songSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    print(notification.audioId);
    return true;
  });
  runApp(
    NeumorphicTheme(
      theme: const NeumorphicThemeData(
        intensity: 0.8,
        lightSource: LightSource.topLeft,
      ),
      child: AssetsChecker(),
    ),
  );
}

class AssetsChecker extends StatefulWidget {
  const AssetsChecker({Key? key}) : super(key: key);

  @override
  _AssetsCheckerState createState() => _AssetsCheckerState();
}

class _AssetsCheckerState extends State<AssetsChecker> {
  final audios = <Audio>[
    Audio(
      "assets/music/daktari.mp3",
      metas: Metas(
        id: "3:10",
        artist: "Ethic Entertainment",
        title: "Daktari",
        image: MetasImage.asset("assets/ethicd.jpg"),
      ),
    ),
    Audio(
      "assets/music/chapa.mp3",
      metas: Metas(
        id: "2:53",
        artist: "Ethic Entertainment",
        title: "Chapa",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),

    Audio(
      "assets/music/figa.mp3",
      metas: Metas(
        id: "3:06",
        artist: "Ethic Entertainment",
        title: "Figa",
        image: MetasImage.asset("assets/ethicfiga.jpg"),
      ),
    ),
    Audio(
      "assets/music/figak.mp3",
      metas: Metas(
        id: "3:12",
        artist: "Ethic Entertainment",
        title: "Figa Remix ft Konshens",
        image: MetasImage.asset("assets/ethicfigra.jpg"),
      ),
    ),

    Audio(
      "assets/music/instagram.mp3",
      metas: Metas(
        id: "3:31",
        artist: "Ethic Entertainment",
        title: "Instagram",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/lambalolo.mp3",
      metas: Metas(
        id: "3:12",
        artist: "Ethic Entertainment",
        title: "Lambalolo",
        image: MetasImage.asset("assets/ethic.jpg"),
      ),
    ),
    Audio(
      "assets/music/maji.mp3",
      metas: Metas(
        id: "3:02",
        artist: "Ethic Entertainment",
        title: "Maji",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/pandana.mp3",
      metas: Metas(
        id: "2:57",
        artist: "Ethic Entertainment",
        title: "Pandana",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/position.mp3",
      metas: Metas(
        id: "3:12",
        artist: "Ethic Entertainment",
        title: "Position",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/quarantei.mp3",
      metas: Metas(
        id: "2:54",
        artist: "Ethic Entertainment",
        title: "Quarantei",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/saba.mp3",
      metas: Metas(
        id: "2:55",
        artist: "Ethic Entertainment",
        title: "Saba",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/soko.mp3",
      metas: Metas(
        id: "3:20",
        artist: "Ethic Entertainment",
        title: "Soko",
        image: MetasImage.asset("assets/ethicsoko.jpg"),
      ),
    ),
    Audio(
      "assets/music/tarimbo.mp3",
      metas: Metas(
        id: "2:55",
        artist: "Ethic Entertainment",
        title: "Tarimbo",
        image: MetasImage.asset("assets/ethic2.jpg"),
      ),
    ),
    Audio(
      "assets/music/thao.mp3",
      metas: Metas(
        id: "3:27",
        artist: "Ethic Entertainment",
        title: "Thao",
        image: MetasImage.asset("assets/ethicj.png"),
      ),
    ),
  ];

  // final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    _subscriptions.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print("playlistAudioFinished : $data");
    }));
    _subscriptions.add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print("audioSessionId : $sessionId");
    }));
    _subscriptions
        .add(AssetsAudioPlayer.addNotificationOpenAction((notification) {
      return false;
    }));

    super.initState();
  
  }
  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print("dispose");
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.black12,
        body: SafeArea(
          child: ListView(
            // physics: BouncingScrollPhysics(),
            children: [
              Container(
                child: Column(
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        _assetsAudioPlayer.builderCurrent(
                            builder: (BuildContext context, Playing playing) {
                          final myAudio =
                              find(audios, playing.audio.assetAudioPath);
                          return Container(
                            width: 270,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  myAudio.metas.title.toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  myAudio.metas.artist.toString(),
                                  ///////////////////////////////////////////////////////////////////
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    // fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black87,
                                  offset: Offset(0, 20),
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(200),
                                bottomRight: Radius.circular(200),
                              ),
                              image: DecorationImage(
                                colorFilter: const ColorFilter.mode(
                                    Colors.black45, BlendMode.multiply),
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  myAudio.metas.image!.path,
                                ),
                              ),
                              // image: DecorationImage(
                              //   fit: BoxFit.cover,
                              //   image: AssetImage(
                              //     myAudio.metas.image.path,
                              //   ),
                              // ),
                            ),
                          );
                          // return SizedBox();
                          return Empty(); /////////////////////image/////////////////////////////////////
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              // PlayerControlsCenter(),
              const SizedBox(
                height: 5,
              ),
              //LIST VIEW SECTION
              _assetsAudioPlayer.builderCurrent(
                builder: (context, playing) {
                  if (playing == null) {
                    return const SizedBox(); /////////////////////seek/////////////////////////////////////
                  }

                  return Column(
                    children: <Widget>[
                      _assetsAudioPlayer.builderRealtimePlayingInfos(
                        builder: (context, infos) {
                          if (infos == null) {
                            return const SizedBox(); /////////////////////seek/////////////////////////////////////
                          }
                          // print("infos: $infos");
                          return Column(
                            children: [
                              PositionSeekWidget(
                                currentPosition: infos.currentPosition,
                                duration: infos.duration,
                                seekTo: (to) {
                                  _assetsAudioPlayer.seek(to);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),

              //PLAYLIST ALL
              _assetsAudioPlayer.builderCurrent(
                builder: (BuildContext context, Playing playing) {
                  return SongsSelector(
                    isPlaying: true,
                    audios: audios,
                    onPlaylistSelected: (myAudios) {
                      _assetsAudioPlayer.open(
                        Playlist(audios: myAudios),
                        showNotification: true,
                        headPhoneStrategy:
                            HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
                        audioFocusStrategy: const AudioFocusStrategy.request(
                          resumeAfterInterruption: true,
                        ),
                      );
                    },
                    ////////////////////////////////////
                    onSelected: (myAudio) async {
                      try {
                        await _assetsAudioPlayer.open(
                          myAudio,
                          autoStart: true,
                          showNotification: true,
                          playInBackground: PlayInBackground.enabled,
                          audioFocusStrategy: const AudioFocusStrategy.request(
                              resumeAfterInterruption: true,
                              resumeOthersPlayersAfterDone: true),
                          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
                          notificationSettings: NotificationSettings(
                            seekBarEnabled: false,
                            stopEnabled: true,
                            customStopAction: (player) {
                              player.stop();
                            },
                            prevEnabled: false,
                            customNextAction: (player) {
                              player.next();
                            },
                            customStopIcon:
                                AndroidResDrawable(name: "ic_stop_custom"),
                            customPauseIcon:
                                AndroidResDrawable(name: "ic_pause_custom"),
                            customPlayIcon:
                                AndroidResDrawable(name: "ic_play_custom"),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                    playing: playing,
                  );
                },
              ),
              // Flexible(
              //   child: Align(
              //     alignment: Alignment(0, 1),
              //     child: _currentAd,
              //   ),
              //   fit: FlexFit.tight,
              //   flex: 2,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
