import 'package:flutter/material.dart';

import '../widgets/animated_square.dart';

class AnimatedSquarePage extends StatelessWidget {
  const AnimatedSquarePage({super.key});

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
      body: const Center(
        child: AnimatedSquare(),
      ),
    );
  }
}
