import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:music_app_ui/const.dart';
import 'package:music_app_ui/providers/fav_provider.dart';
import 'package:music_app_ui/providers/package_provider.dart';
import 'package:music_app_ui/providers/song_provider.dart';
import 'package:music_app_ui/widgets/music_controller.dart';
import 'package:music_app_ui/widgets/song_lyric.dart';
import 'package:provider/provider.dart';

class MusicDetail extends StatefulWidget {
  const MusicDetail({Key? key}) : super(key: key);

  @override
  State<MusicDetail> createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  @override
  Widget build(BuildContext context) {
    SongProvider songProvider = Provider.of<SongProvider>(context);
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    FavProvider favProvider = Provider.of<FavProvider>(context);

    var lyricUI = UINetease(
        highlight: false,
        defaultSize: 18,
        defaultExtSize: 14,
        bias: 0.5,
        lyricAlign: LyricAlign.CENTER,
        lyricBaseLine: LyricBaseLine.CENTER,
        lineGap: 25,
        inlineGap: 25,
        otherMainSize: 14);
    return Stack(
      children: [
        Image.asset(
          'assets/cover/${songProvider.currentSong!.image!}',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [black.withOpacity(0.6), black.withOpacity(0.2), black],
            stops: const [0.2, 0.6, 1.0],
          )),
        ),
        Scaffold(
          backgroundColor: transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded,
                    color: white)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SongLyric(songProvider: songProvider, lyricUI: lyricUI),
              MusicController(
                  songProvider: songProvider,
                  favProvider: favProvider,
                  packageProvider: packageProvider),
            ],
          ),
        )
      ],
    );
  }
}
