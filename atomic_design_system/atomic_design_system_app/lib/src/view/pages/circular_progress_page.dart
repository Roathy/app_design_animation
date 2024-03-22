import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  double percent = 0.0;
  double auxPercent = 0.0;

  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(() {
        // print('${animationController.value}');
        setState(() {
          percent = lerpDouble(percent, auxPercent, animationController.value) ?? 0.0;
        });
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
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          percent = auxPercent;
          auxPercent += 10.0;
          if (auxPercent >= 100.0) {
            auxPercent = 0.0;
            percent = 0.0;
          }
          animationController.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(
          Icons.refresh_sharp,
          color: Colors.red,
        ),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: _ProgressPainter(percent: percent),
          ),
        ),
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  double percent;
  _ProgressPainter({required this.percent});

  // Definir "lápiz", que va a dibujar el círculo
  // Posicionarse en centro de Container
  // Determinar radio del círculo
  // Dibujar círculo
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 6.0
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.50, size.height * 0.50);
    final double radius = min(size.width * 0.50, size.height * 0.50);
    canvas.drawCircle(center, radius, paint);

    final arcsPaint = Paint()
      ..strokeWidth = 6.9
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      arcsPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
