import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('SlideShow Page')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _SlideShowCarrousel(),
          _SlideShowNavigation(),
        ],
      ),
    );
  }
}

class _SlideShowCarrousel extends ConsumerStatefulWidget {
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
        // print('Controller: ${pageController.page} || Riverpod: ${ref.watch(currentPageIndex)}');
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
        children: const [
          _SlideShowSlide(
            path: 'assets/svgs/slide-1.svg',
          ),
          _SlideShowSlide(
            path: 'assets/svgs/slide-2.svg',
          ),
          _SlideShowSlide(
            path: 'assets/svgs/slide-3.svg',
          ),
        ],
      ),
    );
  }
}

class _SlideShowSlide extends StatelessWidget {
  final String path;

  const _SlideShowSlide({
    required this.path,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(90.0),
      child: SvgPicture.asset(path),
    );
  }
}

class _SlideShowNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _NavIndicator(indexPage: 0),
          _NavIndicator(indexPage: 1),
          _NavIndicator(indexPage: 2),
        ],
      ),
    );
  }
}

class _NavIndicator extends ConsumerWidget {
  final int indexPage;

  const _NavIndicator({required this.indexPage});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: 12,
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (indexPage >= ref.watch(currentPageIndex) - 0.5 && indexPage < ref.watch(currentPageIndex) + 0.5) ? Colors.indigo : Colors.grey,
      ),
    );
  }
}
