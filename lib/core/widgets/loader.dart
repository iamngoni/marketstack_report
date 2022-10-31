import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.color = Colors.purple, this.radius = 10});

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (
        BuildContext context,
        double height,
        double width,
        sy,
        sx,
      ) {
        return CupertinoActivityIndicator(
          color: color,
          radius: sy(radius),
        );
      },
    );
  }
}