import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:slideshow_app/UI/Widgets/slideshow.dart';

final currentPageIndex = StateProvider((ref) => 0);

final List<Widget> slides = [
  SvgPicture.asset('assets/svgs/slide-1.svg'),
  SvgPicture.asset('assets/svgs/slide-2.svg'),
  SvgPicture.asset('assets/svgs/slide-3.svg'),
  SvgPicture.asset('assets/svgs/slide-4.svg'),
  SvgPicture.asset('assets/svgs/slide-5.svg'),
];

final listLength = StateProvider((ref) => slides.length);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlideShow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: SlideShow(
          // navAtBottom: false,
          // baseColor: Colors.grey,
          activeColor: Colors.lightBlue,
          slides: slides,
        ),
      ),
    );
  }
}
