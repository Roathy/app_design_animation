import 'package:flutter/material.dart';

import 'page_one.dart';
import 'page_three.dart';
import 'page_two.dart';
import 'widgets/animated_opacity_container.dart';

enum Transition {
  fade,
  rotate,
  slide,
  scale,
}

class AnimatedNavigationPage extends StatelessWidget {
  const AnimatedNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.amber[50],
      appBar: AppBar(title: const Text('Home Page'), actions: [
        IconButton(
            icon: const Icon(Icons.sledding_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  _createRouteAnimated(
                    const PageOne(),
                    Transition.slide,
                  ));
            }),
        IconButton(
            icon: const Icon(Icons.switch_camera_outlined),
            onPressed: () {
              Navigator.push(context, _createRouteAnimated(const PageTwo(), Transition.scale));
            }),
        IconButton(
            icon: const Icon(Icons.opacity_sharp),
            onPressed: () {
              Navigator.push(context, _createRouteAnimated(const PageThree(), Transition.fade));
            })
      ]),
      body: const Column(
        children: [
          Center(child: Text('THIS IS HOME PAGE')),
          AnimatedOpacityContainer()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Route _createRouteAnimated(StatelessWidget route, Transition transition) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => route,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);

          switch (transition) {
            case Transition.slide:
              return SlideTransition(
                position: Tween<Offset>(begin: const Offset(0.5, 1.0), end: Offset.zero).animate(curvedAnimation),
                child: child,
              );
            case Transition.scale:
              return ScaleTransition(
                scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
                child: child,
              );
            case Transition.fade:
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
                child: child,
              );
            default:
              return RotationTransition(
                turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
                child: child,
              );
          }
        });
  }
}
