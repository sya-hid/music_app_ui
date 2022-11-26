import 'package:flutter/material.dart';
import 'package:music_app_ui/const.dart';
import 'package:music_app_ui/providers/fav_provider.dart';
import 'package:music_app_ui/providers/package_provider.dart';
import 'package:music_app_ui/providers/recent_played_provider.dart';
import 'package:music_app_ui/providers/song_provider.dart';
import 'package:music_app_ui/widgets/music_item.dart';
import 'package:provider/provider.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({Key? key}) : super(key: key);

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    FavProvider favProvider = Provider.of<FavProvider>(context);
    SongProvider songProvider = Provider.of<SongProvider>(context);
    RecentProvider recentProvider = Provider.of<RecentProvider>(context);
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:
                  const Icon(Icons.keyboard_arrow_left_rounded, color: white)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_rounded)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 30,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/package/${packageProvider.currentPackage!.image}',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(packageProvider.currentPackage!.name!,
                              style: const TextStyle(
                                  color: white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: grey,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${packageProvider.totalLikes()} Likes',
                                    style: const TextStyle(
                                        color: grey, fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.timer,
                                    color: grey,
                                    size: 12,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '2h 30m',
                                    style: TextStyle(color: grey, fontSize: 12),
                                  )
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  songProvider.isPlaying
                                      ? songProvider.audioPlayer.pause()
                                      : songProvider.currentSong =
                                          packageProvider
                                              .currentPackage!.songs![0];
                                  recentProvider.setRecent(packageProvider
                                      .currentPackage!.songs![0]);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: green),
                                  child: Icon(
                                    songProvider.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    size: 52,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Featuring',
                style: TextStyle(color: white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ...List.generate(
                        packageProvider.currentPackage!.songs!.length, (index) {
                      var data = packageProvider.currentPackage!.songs![index];
                      return Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 0)
                            : const EdgeInsets.only(top: 10),
                        child: MusicItem(
                            songProvider: songProvider,
                            data: data,
                            recentProvider: recentProvider,
                            favProvider: favProvider),
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
