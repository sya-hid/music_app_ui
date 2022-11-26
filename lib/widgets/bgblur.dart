import 'dart:ui';

import 'package:flutter/material.dart';

class BgBlur extends StatelessWidget {
  final double opacity, blur;
  final Widget child;
  final Color color;
  const BgBlur(
      {Key? key,
      required this.opacity,
      required this.blur,
      required this.child,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
          tileMode: TileMode.clamp,
        ),
        child: Container(
            decoration: BoxDecoration(color: color.withOpacity(opacity)),
            child: child),
      ),
    );
  }
}
