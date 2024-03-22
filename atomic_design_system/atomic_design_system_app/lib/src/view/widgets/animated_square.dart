import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'square.dart';

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> bounceRight;
  late final Animation<double> bounceLeft;
  late final Animation<double> bounceUp;
  late final Animation<double> bounceDown;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    bounceRight = Tween(begin: 0.0, end: 120.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.00, 0.25, curve: Curves.bounceOut)),
    );
    bounceUp = Tween(begin: 0.0, end: -120.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)),
    );
    bounceLeft = Tween(begin: 0.0, end: -120.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)),
    );
    bounceDown = Tween(begin: 0.0, end: 120.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.75, 1.00, curve: Curves.bounceOut)),
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: const Square(),
      builder: (BuildContext context, Widget? child) {
        // print('${bounceRight.value}');
        return Transform.translate(
          offset: Offset(
            bounceRight.value + bounceLeft.value,
            bounceUp.value + bounceDown.value,
          ),
          child: child,
        );
      },
    );
  }
}
