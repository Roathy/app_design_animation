import 'package:flutter/material.dart';

class ScrollableVerticalList extends StatelessWidget {
  const ScrollableVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return const WideTileBackground();
  }
}

class WideTileBackground extends StatelessWidget {
  const WideTileBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: <Color>[
          Color(0xff6989F5),
          Color(0xff906EF5)
        ]),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            blurRadius: 30,
            offset: Offset(6, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: const WideTileContent(),
    );
  }
}

class WideTileContent extends StatelessWidget {
  const WideTileContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.access_alarm,
          color: Colors.white,
        ),
        Text(
          'todo vertical list',
          style: TextStyle(color: Colors.white),
        ),
        Icon(Icons.chevron_right_rounded, color: Colors.white),
      ],
    );
  }
}
