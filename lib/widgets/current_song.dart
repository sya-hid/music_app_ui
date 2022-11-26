import 'package:flutter/material.dart';
import 'package:music_app_ui/const.dart';
import 'package:music_app_ui/providers/fav_provider.dart';
import 'package:music_app_ui/providers/song_provider.dart';
import 'package:provider/provider.dart';

class CurrentSong extends StatelessWidget {
  const CurrentSong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongProvider songProvider = Provider.of<SongProvider>(context);
    FavProvider favProvider = Provider.of<FavProvider>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/cover/${songProvider.currentSong!.image!}'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(songProvider.currentSong!.title!,
                    style: const TextStyle(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(songProvider.currentSong!.singer!,
                    style: const TextStyle(color: white, fontSize: 11)),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                favProvider.setFav(songProvider.currentSong!);
              },
              icon: favProvider.isFavorite(songProvider.currentSong!)
                  ? const Icon(
                      Icons.favorite,
                      color: green,
                    )
                  : const Icon(
                      Icons.favorite_border_rounded,
                      color: white,
                    )),
          GestureDetector(
            onTap: () {
              songProvider.isPlaying
                  ? songProvider.audioPlayer.pause()
                  : songProvider.audioPlayer.resume();
            },
            child: SizedBox(
              width: 24,
              height: 24,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator.adaptive(
                    valueColor: const AlwaysStoppedAnimation(green),
                    value: songProvider.playProgress! / songProvider.maxValue!,
                    strokeWidth: 2,
                  ),
                  Icon(
                    songProvider.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow_rounded,
                    color: white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
