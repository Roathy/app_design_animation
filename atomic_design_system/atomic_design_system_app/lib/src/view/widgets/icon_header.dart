import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {
  final Color bottomColor, topColor;
  final String subtitle, title;
  final IconData icon;

  const IconHeader({
    super.key,
    this.bottomColor = Colors.orange,
    this.topColor = Colors.red,
    required this.subtitle,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconHeaderBackground(
      bottomColor: bottomColor,
      topColor: topColor,
      subtitle: subtitle,
      title: title,
      icon: icon,
    );
  }
}

class IconHeaderBackground extends StatelessWidget {
  final Color topColor, bottomColor;
  final String subtitle, title;
  final IconData icon;
  const IconHeaderBackground({
    super.key,
    required this.topColor,
    required this.bottomColor,
    required this.subtitle,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              topColor,
              bottomColor,
            ],
          )),
      child: IconHeaderContent(
        subtitle: subtitle,
        title: title,
        icon: icon,
      ),
    );
  }
}

class IconHeaderContent extends StatelessWidget {
  final String subtitle, title;
  final IconData icon;
  const IconHeaderContent({
    super.key,
    required this.subtitle,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Color whiteOpacity = Colors.white.withOpacity(0.6);

    return Stack(
      children: [
        Positioned(top: -69, left: -69, child: Icon(icon, color: whiteOpacity, size: 210)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 9),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 21),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 90,
            ),
          ],
        ),
      ],
    );
  }
}
