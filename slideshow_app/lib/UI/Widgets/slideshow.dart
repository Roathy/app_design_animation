import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  bool navAtBottom;
  final Color baseColor, activeColor;

  SlideShow({
    super.key,
    required this.slides,
    this.navAtBottom = true,
    this.baseColor = Colors.grey,
    this.activeColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!navAtBottom)
          _SlideShowNavigation(
            baseColor: baseColor,
            activeColor: activeColor,
          ),
        _SlideShowCarrousel(slides: slides),
        if (navAtBottom)
          _SlideShowNavigation(
            baseColor: baseColor,
            activeColor: activeColor,
          ),
      ],
    );
  }
}

class _SlideShowCarrousel extends ConsumerStatefulWidget {
  final List<Widget> slides;

  const _SlideShowCarrousel({required this.slides});

  @override
  ConsumerState<_SlideShowCarrousel> createState() => _SlideShowCarrouselState();
}

class _SlideShowCarrouselState extends ConsumerState<_SlideShowCarrousel> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        ref.read(currentPageIndex.notifier).state = pageController.page!.round();
      });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(90.0),
      child: slide,
      // child: SvgPicture.asset(path),
    );
  }
}

class _SlideShowNavigation extends ConsumerWidget {
  final Color baseColor, activeColor;
  const _SlideShowNavigation({
    this.baseColor = Colors.grey,
    this.activeColor = Colors.indigo,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          ref.watch(listLength),
          (index) => _NavIndicator(
            indexPage: index,
            baseColor: baseColor,
            activeColor: activeColor,
          ),
        ),
      ),
    );
  }
}

class _NavIndicator extends ConsumerWidget {
  final int indexPage;
  final Color baseColor, activeColor;
  const _NavIndicator({
    required this.indexPage,
    this.baseColor = Colors.grey,
    this.activeColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (indexPage >= ref.watch(currentPageIndex) - 0.5 && indexPage < ref.watch(currentPageIndex) + 0.5) ? activeColor : baseColor,
      ),
    );
  }
}
