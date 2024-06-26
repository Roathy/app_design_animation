import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/slideshow.dart';

final slidesProvider = Provider<List<Widget>>((ref) => [
      SvgPicture.asset('assets/svgs/slide-1.svg'),
      SvgPicture.asset('assets/svgs/slide-2.svg'),
      SvgPicture.asset('assets/svgs/slide-3.svg'),
      SvgPicture.asset('assets/svgs/slide-4.svg'),
      SvgPicture.asset('assets/svgs/slide-5.svg'),
    ]);

final listLength = Provider<int>((ref) => ref.watch(slidesProvider).length);

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

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
      body: Consumer(
        builder: (context, ref, _) {
          final slides = ref.watch(slidesProvider);
          return SlideShow(slides: slides);
        },
      ),
    );
  }
}
