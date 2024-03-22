import 'package:flutter/material.dart';

class Tile {
  String title;
  IconData icon;
  void Function() onPress;
  Color leftColor, rightColor;
  Tile(this.title, this.icon, this.leftColor, this.rightColor, this.onPress);
}

final List<Tile> tiles = [
  Tile('ITEM ONE', Icons.car_crash, const Color(0xFF2E3192), const Color(0xFF1BFFFF), () {
    print('taptap');
  }),
  Tile('ITEM TWO', Icons.abc, const Color(0xFFD4145A), const Color(0xFFFBB03B), () {
    print('taptap');
  }),
  Tile('ITEM THREE', Icons.access_alarm, const Color(0xFF009245), const Color(0xFFFCEE21), () {
    print('taptap');
  }),
  Tile('ITEM FOUR', Icons.account_circle_sharp, const Color(0xFF662D8C), const Color(0xFFED1E79), () {
    print('taptap');
  }),
  Tile('ITEM FIVE', Icons.dangerous, const Color(0xFFEE9CA7), const Color(0xFFFFDDE1), () {
    print('taptap');
  }),
  Tile('ITEM SIX', Icons.e_mobiledata, const Color(0xFF614385), const Color(0xFF516395), () {
    print('taptap');
  }),
  Tile('ITEM SEVEN', Icons.face, const Color(0xFF02AABD), const Color(0xFF00CDAC), () {
    print('taptap');
  }),
  Tile('ITEM ONE', Icons.car_crash, const Color(0xFF2E3192), const Color(0xFF1BFFFF), () {
    print('taptap');
  }),
  Tile('ITEM TWO', Icons.abc, const Color(0xFFD4145A), const Color(0xFFFBB03B), () {
    print('taptap');
  }),
  Tile('ITEM THREE', Icons.access_alarm, const Color(0xFF009245), const Color(0xFFFCEE21), () {
    print('taptap');
  }),
  Tile('ITEM FOUR', Icons.account_circle_sharp, const Color(0xFF662D8C), const Color(0xFFED1E79), () {
    print('taptap');
  }),
  Tile('ITEM FIVE', Icons.dangerous, const Color(0xFFEE9CA7), const Color(0xFFFFDDE1), () {
    print('taptap');
  }),
  Tile('ITEM SIX', Icons.e_mobiledata, const Color(0xFF614385), const Color(0xFF516395), () {
    print('taptap');
  }),
  Tile('ITEM SEVEN', Icons.face, const Color(0xFF02AABD), const Color(0xFF00CDAC), () {
    print('taptap');
  }),
];

class ScrollableVerticalList extends StatelessWidget {
  const ScrollableVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tiles.length + 1,
          itemBuilder: (context, index) {
            return index == 0 ? const SizedBox(height: 60) : WideTileBackground(tile: tiles[index - 1]);
          }),
    );
  }
}

class WideTileBackground extends StatelessWidget {
  final Tile tile;
  const WideTileBackground({
    super.key,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: <Color>[
          tile.leftColor,
          tile.rightColor
        ]),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: WideTileContent(tile: tile),
    );
  }
}

class WideTileContent extends StatelessWidget {
  final Tile tile;
  const WideTileContent({
    super.key,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tile.onPress,
      behavior: HitTestBehavior.opaque,
      child: Stack(children: [
        Positioned(
            top: -18,
            right: -18,
            child: Icon(
              tile.icon,
              color: Colors.white.withOpacity(0.3),
              size: 120,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60, width: 21),
            Icon(
              tile.icon,
              color: Colors.white,
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                tile.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ]),
    );
  }
}
