import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';

import '../../db/welcome_slides_db.dart';
import 'widgets/slideshow.dart';

final listLength = Provider<int>((ref) => ref.watch(slidesProvider).length);

class WelcomeTourPage extends ConsumerWidget {
  const WelcomeTourPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> slides = ref
        .watch(slidesProvider)
        .map((slide) => _AnimationContainer(
              assetUrl: slide.assetUrl,
              title: slide.title,
              textContent: slide.textContent,
              note: slide.note,
              multimedia: slide.multimedia,
            ))
        .toList();
    return Scaffold(body: SafeArea(child: SlideShow(slides: slides)));
  }
}

class _AnimationContainer extends StatelessWidget {
  final String title;
  final Widget textContent;
  final String assetUrl;
  final String? note;
  final Widget? multimedia;
  const _AnimationContainer({required this.assetUrl, required this.title, required this.textContent, this.note, this.multimedia});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 27),
      Text(
        title,
        style: TextStyle(color: Colors.blue[600], fontSize: 24, letterSpacing: 0.6),
      ),
      const SizedBox(height: 27),
      textContent,
      note != null
          ? Text(
              note ?? '',
              style: const TextStyle(fontSize: 6),
            )
          : const SizedBox(),
      const SizedBox(height: 27),
      Expanded(
        child: assetUrl == '' ? multimedia! : RiveAnimation.asset(assetUrl),
      )
    ]);
  }
}
