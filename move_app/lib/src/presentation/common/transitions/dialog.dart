import 'package:flutter/material.dart';

Future<T?> dialogBuilder<T>(
    BuildContext context, Offset currentPosition, Widget content) {
  final dx = currentPosition.dx / MediaQuery.of(context).size.width;
  final dy = (currentPosition.dy / MediaQuery.of(context).size.height);
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Label",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      var tween = CurveTween(curve: Curves.easeOutCirc).animate(animation);
      return AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            return _DialogContent(
              dx: dx,
              dy: dy,
              tween: tween,
              child: child,
            );
          });
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: FractionalOffset.center,
        child: content,
      );
    },
  );
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({
    required this.dx,
    required this.dy,
    required this.tween,
    required this.child,
  });

  final double dx;
  final double dy;
  final Animation<double> tween;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset(dx, dy),
      transform: Matrix4.identity()..scale(tween.value),
      child: child,
    );
  }
}
