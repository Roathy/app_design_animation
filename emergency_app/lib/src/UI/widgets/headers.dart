import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color(0xff615AAB),
    );
  }
}

class RoundedHeader extends StatelessWidget {
  const RoundedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(90)),
      ),
    );
  }
}

class InclinedHeader extends StatelessWidget {
  const InclinedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _DiagonalPainter(),
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff615AAB)
      ..style = PaintingStyle.fill;
    // ..strokeWidth = 0.0;

    final path = Path();

    path.lineTo(0, size.height * 0.21);
    path.lineTo(size.width, size.height * 0.18);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangularHeader extends StatelessWidget {
  const TriangularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _TriangularPainter(),
      ),
    );
  }
}

class _TriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff615AAB)
      ..style = PaintingStyle.fill;

    final path = Path();

// right up triangle
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);

// left down triangle
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);

// left triangle
    // path.lineTo(size.width * 0.5, size.height * 0.5);
    // path.lineTo(0, size.height);

//  right triangle
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PentagonHeader extends StatelessWidget {
  const PentagonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _PentagonPainter(color: const Color(0xff615AAB), peakX: 0.5, peakY: 0.3, rightEdgeY: 0.18),
      ),
    );
  }
}

class PentagonStackHeader extends StatelessWidget {
  const PentagonStackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _PentagonPainter(
              color: const Color(0xff165AAB),
              peakX: 0.81,
              peakY: 0.30,
              rightEdgeY: 0.237,
            ),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _PentagonPainter(
              color: const Color(0xff615AAB),
              peakX: 0.66,
              peakY: 0.33,
              rightEdgeY: 0.21,
            ),
          ),
        ),
      ],
    );
  }
}

class _PentagonPainter extends CustomPainter {
  final Color color;
  final double peakX, peakY;
  final double rightEdgeY;

  _PentagonPainter({
    required this.peakX,
    required this.peakY,
    required this.rightEdgeY,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.18);
    path.lineTo(size.width * peakX, size.height * peakY);
    path.lineTo(size.width, size.height * rightEdgeY);
    path.lineTo(size.width, 0);

    path.close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircularHeader extends StatelessWidget {
  const CircularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _CircularPainter(),
      ),
    );
  }
}

class _CircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.30, size.width, size.height * 0.21);
    path.lineTo(size.width, 0);

    path.close();

    final paint = Paint()
      ..color = const Color(0xff615AAB)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesHeader extends StatelessWidget {
  const WavesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _WavesPainter(),
      ),
    );
  }
}

class _WavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.24, size.width * 0.50, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18, size.width, size.height * 0.24);
    path.lineTo(size.width, 0);
    path.close();

    final paint = Paint()
      ..color = const Color(0xff615AAB)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesGradientHeader extends StatelessWidget {
  const WavesGradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(
        painter: _WavesGradientPainter(),
      ),
    );
  }
}

class _WavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width * 0.5, 60.0),
      radius: 90,
    );

    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
    );

    final path = Path();
    path.lineTo(0, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.24, size.width * 0.50, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18, size.width, size.height * 0.24);
    path.lineTo(size.width, 0);
    path.close();

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
