import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bg_image_container.dart';

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

class VerticalSliverList extends StatelessWidget {
  const VerticalSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPersistentHeader(
        delegate: _SliverCustomHeaderDelegate(
            minHeight: 229,
            maxHeight: 229,
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: _MainHeader(),
            )),
        floating: true,
      ),
      SliverList(delegate: SliverChildBuilderDelegate(childCount: 2, (context, index) => _ListItem(index)))
    ]);
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class _MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final formatter = DateFormat('EEEE, LLLL d, yyyy');
    String formattedDate = formatter.format(now);

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          BgImageContainer(
            height: 145,
            width: 130,
            imageUrl: 'assets/images/asksteven.jpg',
            content: Center(
                child: Text(
              textAlign: TextAlign.center,
              'General English levels',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )),
          ),
          SizedBox(width: 27),
          BgImageContainer(
            height: 145,
            width: 130,
            imageUrl: 'assets/images/asksteven.jpg',
            content: Center(
                child: Text(
              textAlign: TextAlign.center,
              'Professional English areas',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )),
          ),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(formattedDate, style: const TextStyle(fontSize: 15, color: Colors.black54)),
          const Text('Today for you:', style: TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold)),
        ]),
      ]),
    ]);
  }
}

// ignore: must_be_immutable
class _ListItem extends StatelessWidget {
  final int index;
  const _ListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return _ListContentShowcase(index: index);
  }
}

class _ListContentShowcase extends StatelessWidget {
  const _ListContentShowcase({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 12, right: 12, top: 18, bottom: 18),
        decoration: BoxDecoration(
          color: colorList[index],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('ITEM $index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              )),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: Colors.green[500]),
            child: const Text(
              'General English',
              style: TextStyle(color: Colors.white, fontSize: 9, letterSpacing: 0.6),
            ),
          )
        ]));
  }
}

class _SmallContentShowcaseBG extends StatelessWidget {
  final String title;

  const _SmallContentShowcaseBG({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 130,
      padding: const EdgeInsets.only(left: 9),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: <Color>[
          Colors.lightBlue,
          Colors.blue
        ]),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black45,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: _SmallContentShowcase(
        title: title,
      ),
    );
  }
}

class _SmallContentShowcase extends StatelessWidget {
  final String title;

  const _SmallContentShowcase({required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Stack(children: [
        Positioned(
            right: -45,
            bottom: -18,
            child: Icon(
              Icons.handyman,
              color: Colors.white.withOpacity(0.3),
              size: 120,
            )),
        Center(
            child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            letterSpacing: 0.6,
          ),
        )),
      ]),
    );
  }
}

// class _ContentShowcase extends StatelessWidget {
//   final String backgroundMediaUrl;
//   final String title;
//   const _ContentShowcase({required this.title, required this.backgroundMediaUrl});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       width: 120,
//       padding: const EdgeInsets.symmetric(horizontal: 9),
//       margin: const EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 24),
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         color: Colors.blue[700],
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: const <BoxShadow>[
//           BoxShadow(
//             color: Colors.black45,
//             blurRadius: 1,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//               bottom: -15,
//               right: -45,
//               child: Icon(
//                 Icons.ac_unit,
//                 color: Colors.white.withOpacity(0.3),
//                 size: 120,
//               )),
//           Text(title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 letterSpacing: 1,
//               )),
//         ],
//       ),
//     );
//   }
// }