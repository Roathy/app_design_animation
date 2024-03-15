import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Color> colorList = [
  // Index 0 - Purple Blue: #2E3192
  const Color(0xFF2E3192),
  // Index 1 - Turquoise: #1BFFFF
  const Color(0xFF1BFFFF),
  // Index 2 - Pink Red: #D4145A
  const Color(0xFFD4145A),
  // Index 3 - Yellow Orange: #FBB03B
  const Color(0xFFFBB03B),
  // Index 4 - Dark Green: #009245
  const Color(0xFF009245),
  // Index 5 - Yellow Green: #FCEE21
  const Color(0xFFFCEE21),
  // Index 6 - Dark Purple: #662D8C
  const Color(0xFF662D8C),
  // Index 7 - Deep Pink: #ED1E79
  const Color(0xFFED1E79),
  // Index 8 - Light Pink: #EE9CA7
  const Color(0xFFEE9CA7),
  // Index 9 - Very Light Pink: #FFDDE1
  const Color(0xFFFFDDE1),
  // Index 10 - Dark Purple Blue: #614385
  const Color(0xFF614385),
  // Index 11 - Purple Blue: #516395
  const Color(0xFF516395),
  // Index 12 - Light Blue: #02AABD
  const Color(0xFF02AABD),
  // Index 13 - Turquoise: #00CDAC
  const Color(0xFF00CDAC),
  // Index 14 - Red Orange: #FF512F
  const Color(0xFFFF512F),
  // Index 15 - Deep Pink: #DD2476
  const Color(0xFFDD2476),
  // Index 16 - Light Red: #FF5F6D
  const Color(0xFFFF5F6D),
  // Index 17 - Light Orange: #FFC371
  const Color(0xFFFFC371),
  // Index 18 - Dark Turquoise: #11998E
  const Color(0xFF11998E),
  // Index 19 - Light Green: #38EF7D
  const Color(0xFF38EF7D),
  // Index 20 - Light Green: #C6EA8D
  const Color(0xFFC6EA8D),
  // Index 21 - Light Pink: #FE90AF
  const Color(0xFFFE90AF),
  // Index 22 - Light Pink: #EA8D8D
  const Color(0xFFEA8D8D),
  // Index 23 - Light Purple: #A890FE
  const Color(0xFFA890FE),
  // Index 24 - Light Purple Blue: #D8B5FF
  const Color(0xFFD8B5FF),
  // Index 25 - Turquoise Green: #1EAE98
  const Color(0xFF1EAE98),
  // Index 26 - Pink Red: #FF61D2
  const Color(0xFFFF61D2),
  // Index 27 - Light Red: #FE9090
  const Color(0xFFFE9090),
  // Index 28 - Light Green: #BFF098
  const Color(0xFFBFF098),
  // Index 29 - Light Turquoise: #6FD6FF
  const Color(0xFF6FD6FF),
  // Index 30 - Blue: #4E65FF
  const Color(0xFF4E65FF),
  // Index 31 - Light Blue: #92EFFD
  const Color(0xFF92EFFD),
  // Index 32 - Light Turquoise Green: #A9F1DF
  const Color(0xFFA9F1DF),
  // Index 33 - Light Pink Red: #FFBBBB
  const Color(0xFFFFBBBB),
  // Index 34 - Light Pink Orange: #FFECD2
  const Color(0xFFFFECD2),
  // Index 35 - Light Orange: #FCB69F
  const Color(0xFFFCB69F),
];

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: ListView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   itemCount: colorList.length,
        //   itemBuilder: (context, index) => _ListItem(index),
        // ),
        child: _MainHeader(),
      ),
    );
  }
}

class _MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('New', style: TextStyle(fontSize: 39)),
        Stack(
          children: [
            Positioned(
              bottom: 12,
              child: Container(
                height: 3,
                width: 90,
                decoration: BoxDecoration(color: colorList[16]),
              ),
            ),
            Text('List', style: TextStyle(fontSize: 39, color: colorList[2], fontWeight: FontWeight.bold))
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _ListItem extends StatelessWidget {
  late int index;
  _ListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: colorList[index],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text('ITEM $index',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            )));
  }
}
