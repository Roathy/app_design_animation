import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/square.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))
          ],
        ),
        body: const Center(child: AnimatedSquare()));
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> scale;
  late final Animation<double> rotate;
  late final Animation<double> opacity;
  late final Animation<double> opacityOut;
  late final Animation<double> moveToRight;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    rotate = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInBack),
    );

    opacity = Tween(begin: 0.24, end: 0.90).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.0, 0.69, curve: Curves.easeOutSine)),
    );

    opacityOut = Tween(begin: 0.9, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.69, 1.00, curve: Curves.easeOut)),
    );

    moveToRight = Tween(begin: 0.0, end: 120.0).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.25, 1.00, curve: Curves.easeInBack)),
    );

    scale = Tween(begin: 0.25, end: 1.25).animate(
      CurvedAnimation(parent: animationController, curve: const Interval(0.25, 1.00, curve: Curves.easeInCirc)),
    );

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    // Play sólo cuando inicia por primera vez
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play cada vez que se reconstruye el widget
    // animationController.forward();

    // Repeat para ilusión de movimiento infinito
    // animationController.repeat();

    return AnimatedBuilder(
      animation: animationController,
      child: const Square(),
      builder: (BuildContext context, Widget? child) {
        print('Status: ${animationController.status}');

        return Transform.translate(
          offset: Offset(moveToRight.value, moveToRight.value * 0.5),
          child: Transform.rotate(
            angle: rotate.value,
            child: Opacity(
              opacity: opacity.value,
              child: Opacity(
                opacity: opacityOut.value,
                child: Transform.scale(
                  scale: scale.value,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
