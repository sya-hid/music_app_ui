import 'package:flutter/material.dart';
import 'package:music_app_ui/const.dart';

class SongPackageItem extends StatelessWidget {
  final String image, text;
  const SongPackageItem({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.35,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/$image'), fit: BoxFit.cover)),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          maxLines: 2,
          style: const TextStyle(color: white, fontSize: 14),
        )
      ],
    );
  }
}
