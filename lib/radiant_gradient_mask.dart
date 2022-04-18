import 'package:flutter/material.dart';

// apples a radial gradient to child
// don't forget to set child color to white

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child, required this.centerColor, required this.edgeColor}) : super(key: key);

  final Widget child;
  final Color centerColor;
  final Color edgeColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [centerColor, edgeColor],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
