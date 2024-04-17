import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percent;
  // ignore: prefer_typing_uninitialized_variables
  final circleColor;
  // ignore: prefer_typing_uninitialized_variables
  final progressColor;
  // ignore: prefer_typing_uninitialized_variables
  final progressStrokeWidth;

  const RadialProgress({
    required this.percent,
    super.key,
    this.circleColor = Colors.black,
    this.progressColor = Colors.black,
    this.progressStrokeWidth = 6.0,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  double previousPercent = 0.0;

  late final AnimationController animationController;

  @override
  void initState() {
    previousPercent = widget.percent;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward(from: 0.00);
    final percentToAnimate = widget.percent - previousPercent;
    previousPercent = widget.percent;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, child) {
        return Container(
          padding: const EdgeInsets.all(6),
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _ProgressPainter(
              percent: (widget.percent - percentToAnimate) + (percentToAnimate * animationController.value),
              circleColor: widget.circleColor,
              progressColor: widget.progressColor,
              progressStrokeWidth: widget.progressStrokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _ProgressPainter extends CustomPainter {
  double percent;
  late final Color? circleColor;
  late final Color? progressColor;
  late final double? progressStrokeWidth;
  _ProgressPainter({
    required this.percent,
    this.circleColor,
    this.progressColor,
    this.progressStrokeWidth,
  });

  // Definir "lápiz", que va a dibujar el círculo
  // Posicionarse en centro de Container
  // Determinar radio del círculo
  // Dibujar círculo
  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(colors: <Color>[
      // const Color(0xffC012FF),
      // const Color(0xff6D05E8),
      // Colors.black,
      Colors.white,
      progressColor!,
    ]);

    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    final paint = Paint()
      ..strokeWidth = 3.0
      ..color = circleColor!
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.50, size.height * 0.50);
    final double radius = min(size.width * 0.50, size.height * 0.50);
    canvas.drawCircle(center, radius, paint);

    final arcsPaint = Paint()
      // ..color = progressColor!
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressStrokeWidth!;

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
