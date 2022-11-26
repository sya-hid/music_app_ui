import 'package:flutter/material.dart';

const black = Colors.black;
const white = Colors.white;
const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const grey = Colors.grey;
const transparent = Colors.transparent;

List<IconData> icons = [
  Icons.home_outlined,
  Icons.search_outlined,
  Icons.library_music_outlined,
  Icons.person_outline_rounded
];

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
