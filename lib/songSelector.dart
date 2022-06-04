import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

//   SONG SELECTOR

class SongsSelector extends StatefulWidget {
  final bool isPlaying;
  final Playing playing;
  final List<Audio> audios;
  final Function(Audio) onSelected;
  final Function(List<Audio>) onPlaylistSelected;

  const SongsSelector(
      {Key? key, required this.isPlaying,
      required this.playing,
      required this.audios,
      required this.onSelected,
      required this.onPlaylistSelected}) : super(key: key);

  @override
  _SongsSelectorState createState() => _SongsSelectorState();
}

class _SongsSelectorState extends State<SongsSelector> {

  AssetsAudioPlayer get _assetsAudioPlayer => AssetsAudioPlayer.withId("music");

  @override
  void initState() {
    super.initState();
  }

  Widget _image(Audio item) {
    //ALBUM ART DISPLAY SECTION
    if (item.metas.image == null) {
      return const SizedBox(height: 40, width: 40);
    }

    return item.metas.image?.type == ImageType.network
        ? Image.network(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          )
        : Image.asset(
            item.metas.image!.path,
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          );
  }
////////////////DISPOSE MEMORY////////////////////////////

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    print("dispose");
    super.dispose();
  }
//////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // PLAY ALL BUTTON
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            widget.onPlaylistSelected(widget.audios);

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Play all continuously'),
              Icon(
                Icons.play_circle_filled,
                size: 48,
                color: Colors.green,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // physics: BouncingScrollPhysics(),
            itemBuilder: (context, position) {
              final item = widget.audios[position];
              final isPlaying =
                  item.path == widget.playing.audio.assetAudioPath;
              return Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                  right: 60,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: InkWell(
                    onTap: () => widget.onSelected(item),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.metas.title.toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: isPlaying ? Colors.blue : Colors.black,
                                // fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            item.metas.id.toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: isPlaying ? Colors.blue : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.audios.length,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
