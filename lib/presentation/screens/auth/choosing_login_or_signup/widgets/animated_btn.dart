import 'package:flutter/material.dart';
import 'package:student_app/presentation/widgets/default_button.dart';

class AnimatedBtn extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final DefaultButton? defaultButton;

  const AnimatedBtn({
    Key? key,
    this.animationController,
    this.animation,
    this.defaultButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation!,
              child:  Transform(
                  transform:  Matrix4.translationValues(
                      0.0, 50 * (1.0 - animation!.value), 0.0),
                  child: defaultButton));
        });
  }
}
