import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SvgAnimationsPage extends StatelessWidget {
  const SvgAnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 150,
              height: 150,
              child: const RiveAnimation.asset(
                'assets/animations/landing_hands_animation.riv',
              )),
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 150,
              height: 150,
              child: const RiveAnimation.asset(
                'assets/animations/landing_isa_animation.riv',
              )),
          Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: 150,
              height: 150,
              child: const RiveAnimation.asset(
                'assets/animations/landing_stars_animation.riv',
              )),
        ],
      ),
    );
  }
}
