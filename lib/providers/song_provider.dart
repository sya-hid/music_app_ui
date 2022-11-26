import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app_ui/models/songs.dart';

class SongProvider with ChangeNotifier {
  SongModel? _currentSong;
  SongModel? get currentSong => _currentSong;
  String? lyric;
  double? playProgress = 0, maxValue = 1;
  set currentSong(SongModel? current) {
    _currentSong = current;
    getLyric(current!.lyric);
    setAudio(current.songUrl!);
    notifyListeners();
  }

  getLyric(String? path) async {
    if (path != '') {
      lyric = await rootBundle.loadString('assets/lyric/$path');
    } else {
      lyric = '';
    }
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool isPlaying) {
    _isPlaying = isPlaying;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isPlaying) {
        time += 1;
      } else {
        timer.cancel();
        time = 0;
      }
    });
    notifyListeners();
  }

  int _time = 0;
  int get time => _time;
  set time(int time) {
    _time = time;
    notifyListeners();
  }

  final audioPlayer = AudioPlayer();
  setAudio(String song) async {
    audioPlayer.setReleaseMode(ReleaseMode.STOP);
    final player = AudioCache(prefix: 'assets/song/');
    final url = await player.load(song);
    audioPlayer.setUrl(url.path, isLocal: true);
    audioPlayer.play(url.path);
    audioPlayer.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.PLAYING;
    });
    audioPlayer.onDurationChanged.listen((event) {
      maxValue = event.inMilliseconds.toDouble();
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      playProgress = event.inMilliseconds.toDouble();
    });
  }
}
